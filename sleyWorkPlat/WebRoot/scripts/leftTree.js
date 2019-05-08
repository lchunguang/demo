// JavaScript Document
	$(function() {
		  $(".max").parent().next("div").slideUp("fast");
	});

window.onload = function(){
   
    initliclass('tree');
}


function initliclass(elem){
    var treenode = document.getElementsByName(elem)
    for (var treenodeindex = 0; treenodeindex < treenode.length; treenodeindex++) {
        var allas = treenode[treenodeindex].getElementsByTagName('a');
        for (var i = 0; i < allas.length; i++) {
            var endchar = allas[i].href;           
            var img = document.createElement('img');
            img.setAttribute('src', 'images/index/triangle_blue.png');
            img.setAttribute('alt', 'open');
            
            var parent = allas[i].parentElement || allas[i].parentNode;
            parent.insertBefore(img, allas[i]);
            
            if (endchar == 'javascript:void(0)') {
                allas[i].onclick = function(e){
                    if (!e) {
                        e = window.event;
                    }
                    var nowa = e.srcElement || e.target;
                    var parentli = nowa.parentElement || nowa.parentNode;
                    var childimg = parentli.getElementsByTagName('img');
                    if (childimg[0].alt == 'open') {
                        childimg[0].src = 'images/index/triangle_darkblue_open.png';
                        childimg[0].alt = 'close';
                    }
                    else {
                        childimg[0].src = 'images/index/triangle_blue.png';
                        childimg[0].alt = 'open';
                    }
                    var childul = parentli.getElementsByTagName('ul');
                    for (var zz = 0; zz < childul.length; zz++) {
                        var p1 = childul[zz].parentElement || childul[zz].parentNode;
                        if (p1 == parentli) {
                            if (childul[zz].style.display == 'none') {
                                childul[zz].style.display = 'block';
                            }
                            else {
                                if (childul[zz].style.display != 'block') {
                                    childul[zz].style.display = 'block';
                                }
                                else {
                                    childul[zz].style.display = 'none';
                                }
                            }
                        }
                    }
                    
                }
            }
            else {
                img.setAttribute('src', 'images/index/triangle_blue.png');
            }
        }
    }
}
