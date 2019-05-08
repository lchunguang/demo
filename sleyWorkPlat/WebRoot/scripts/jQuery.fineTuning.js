(function ($) {   
    $.fineTuning = $.fineTuning || {};   
    $.extend($.fineTuning, {   
        version: "1.00",   
        addTxt: function (fill, options) {   
            options = $.extend({   
                maxValue: 30, /*最大值*/  
                minValue: 0, /*最小值*/  
                defValue: 1, /*默认值*/  
                txtWidth: 100, /*文本框大小*/ 
                ftValue: 1  /*微调数量*/
            }, options || {});   
            fill = $(fill);   
            var h = [];  
            h.push('<span><img src="../images/jQuery.fineTuning/MW_left.png"  name="Pre"/></span>'); 			
            h.push('<input type="text" name="TextNum"/>');   	
            h.push('<span><img src="../images/jQuery.fineTuning//MW_right.png"  name="Next"/></span>');   
            fill.append(h.join('')); /*在父级div中 添加用到的控件*/  
            var TxtBox = $(":text", fill);   
            TxtBox.val(options.defValue).width(options.txtWidth)/*设置文本框大小*/  
                    .addClass("ui-widget ui-widget-content")   
                    .bind("blur keyup",function(){   
                        var TxtNum = parseInt($(this).val());      
                        if(!TxtNum && TxtNum !=0){                             
                        $(this).val(options.minValue);   
                        return;   
                        }   
                        $(this).val((TxtNum> options.maxValue) ? options.maxValue :((TxtNum< options.minValue) ? options.minValue :TxtNum));                 
                    });    
            fill.width(TxtBox.width()).height(TxtBox.height()) /*设置父级div宽度，高度与textbox相同*/  
                .css({ "position": "relative", "height": "100%" }); /*设置父级div样式*/  
            $("dt", fill).addClass("ui-state-default"); /*给所有的控件加上样式*/  
           /** AddHover($("a", $(fill)));  **/ 
            fill.bind("click", function (event) {  
                if (!event) event = window.event;   
                var target = (event.target) ? event.target : event.srcElement;   
                if (target.tagName == "IMG") {   
                    FineTuning(options, $(target), fill);   
                }   
            });   
        }    
       
    });   
    //鼠标悬浮时更改样式 ---私有     
    function AddHover(obj) {   
        $(obj).hover(   
                function (event) {   
                    if (!event) event = window.event;   
                    var target = (event.target) ? event.target : event.srcElement;   
                    if (target.tagName == "A") {   
                        $(target).parents("dt").addClass("ui-state-hover");   
                    }   
                },   
                 function (event) {   
                     if (!event) event = window.event;   
                     var target = (event.target) ? event.target : event.srcElement;   
                     if (target.tagName == "A") {   
                         $(target).parents("dt").removeClass("ui-state-hover");   
                     }   
                 }   
    );   
    }   
    //私有方法   
    function FineTuning(opt, obj, parent) {  
        /*FineTuning微调的实体方法开始*/  
        var MinVal = parseInt(opt.minValue * 10);   
        var MaxVal = parseInt(opt.maxValue * 10);   
        var FtValue = parseInt(opt.ftValue * 10);
        var ClickName = $(obj).attr("name");   
        var TxtBox = $("input:text", $(parent));   
        var TxtNum = parseInt(TxtBox.val() * 10);   
        TxtNum.toFixed(2);
        if(!TxtNum && TxtNum !=0){
            TxtBox.val(MinVal);return;
        }
        
        switch (ClickName) {   
            case "Pre":   
                {   
                    TxtBox.val((TxtNum - FtValue < MinVal) ? MinVal : ((TxtNum - FtValue)/10));   
                } break;   
            case "Next":   
                {   
                    TxtBox.val((TxtNum + FtValue > MaxVal) ? MaxVal : ((TxtNum + FtValue)/10));   
                } break;   
        }   
        /*FineTuning微调的实体方法结束*/  
    }
})(jQuery);