if (window.location.href.match("mycourses2.mcgill.ca")) {
    try{
        var div = document.getElementsByClassName("d2l-fileviewer");
        if (div && div.length > 0) {
            var contains_src = div[0].children[0];
            if (contains_src){
                var src = contains_src.dataset.location;
                document.location = src;
                setTimeout(function(){
                    window.history.back();
                }, 4000);
                //window.history.back();
            }
        }
    } catch(e){
        alert(e);
    }
};
