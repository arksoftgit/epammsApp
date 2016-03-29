tinymce.init({
  selector: 'div.mceSimpleZeidon',
  inline: true,
  menubar: false,
  width : "100%",
  oninit : "resizeTiny",
  toolbar: "bold italic underline strikethrough | subscript superscript | undo redo | removeformat visualchars visualblocks nonbreaking | charmap preview fullscreen",
  plugins: [
    "autoresize charmap preview visualblocks visualchars fullscreen paste fullpage"
  ]
});

// Returns text statistics for the specified editor by id
function getTinyStats(id) {
    var body = tinymce.get(id).getBody(), text = tinymce.trim(body.innerText || body.textContent);

    return {
        chars: text.length,
        words: text.split(/[\w\u2019\'-]+/).length
    };
}

function resizeTiny() {
    if (!tinyMCE) return;
    var footer = document.getElementById("overview-footer");
    var header = document.getElementById("main-box-header");
    tinyMCE.get("editor1").theme.resizeTo(
        footer.clientWidth - 2,
        footer.offsetTop - header.offsetHeight - 105
    );
}

//tinyMCE.dom.Event.add(window,'resize',function(){
//    resizeTiny();
//});
















