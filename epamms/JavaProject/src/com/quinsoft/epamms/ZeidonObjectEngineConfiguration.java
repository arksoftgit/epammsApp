/**
 *
 */
package com.quinsoft.epamms;

import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.TimeUnit;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.RemovalCause;
import com.google.common.cache.RemovalListener;
import com.google.common.cache.RemovalNotification;
import com.quinsoft.zeidon.ObjectEngine;
import com.quinsoft.zeidon.ObjectEngineEventListener;
import com.quinsoft.zeidon.Task;
import com.quinsoft.zeidon.jmx.JmxObjectEngineMonitor;
import com.quinsoft.zeidon.standardoe.DefaultJavaOeConfiguration;
import com.quinsoft.zeidon.standardoe.JavaObjectEngine;

/**
 * Configuration options for ePamms JOE.
 *
 * @author dgc
 *
 */
public class ZeidonObjectEngineConfiguration extends DefaultJavaOeConfiguration
{
    private static ObjectEngine s_objectEngine = null;

   /**
    * Retrieves the Zeidon Java Object Engine configured for ePamms.
    *
    * @return
    */
    public final static synchronized ObjectEngine getObjectEngine()
   {
        if ( s_objectEngine == null )
            return JavaObjectEngine.getInstance( new ZeidonObjectEngineConfiguration() );

      return s_objectEngine;
   }

    /* (non-Javadoc)
     * @see com.quinsoft.zeidon.standardoe.JavaOeOptions#getObjectEngineListener()
     */
    @Override
    public ObjectEngineEventListener getObjectEngineListener()
    {
        if ( oeListener == null )
            oeListener = new JmxObjectEngineMonitor(this);

        return oeListener;
    }

   /**
    * This creates a hash map for caching tasks.  It will expire tasks if they have not
    * been accessed in the last 60 minutes.
    */
   @Override
   public ConcurrentMap<String, Task> getPersistentTaskCacheMap()
   {
      if ( taskCacheMap == null )
      {
         Cache<String, Task> c = CacheBuilder.newBuilder()
                                                .concurrencyLevel( 10 )
                                                .expireAfterAccess( 60, TimeUnit.MINUTES )
                                                .removalListener( new TaskCacheRemovalListener() )
                                                .build();
         taskCacheMap = c.asMap();
      }

      return taskCacheMap;
   }

   /**
    * Logs a warning if a task is ejected because it timed out.
    */
   private class TaskCacheRemovalListener implements RemovalListener<String, Task>
   {
      @Override
      public void onRemoval( RemovalNotification<String, Task> notification )
      {
         if ( notification.getCause() == RemovalCause.EXPIRED )
         {
            // It's possible that the SystemTask will be ejected.  This is ok because this cache is only
            // used to prevent GC on a task and the JOE keeps a reference to the system task.  However,
            // we won't drop it.
            Task task = notification.getValue();
            if ( task != task.getSystemTask() )
            {
            // notification.getValue().log().warn( "This task was ejected from task cache map because it expired." );
               notification.getValue().dropTask(); // Tell Zeidon to drop this task from the task list.
            }
         }
      }
   }
}
