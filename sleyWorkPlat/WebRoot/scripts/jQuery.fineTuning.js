(function ($) {   
    $.fineTuning = $.fineTuning || {};   
    $.extend($.fineTuning, {   
        version: "1.00",   
        addTxt: function (fill, options) {   
            options = $.extend({   
                maxValue: 30, /*���ֵ*/  
                minValue: 0, /*��Сֵ*/  
                defValue: 1, /*Ĭ��ֵ*/  
                txtWidth: 100, /*�ı����С*/ 
                ftValue: 1  /*΢������*/
            }, options || {});   
            fill = $(fill);   
            var h = [];  
            h.push('<span><img src="../images/jQuery.fineTuning/MW_left.png"  name="Pre"/></span>'); 			
            h.push('<input type="text" name="TextNum"/>');   	
            h.push('<span><img src="../images/jQuery.fineTuning//MW_right.png"  name="Next"/></span>');   
            fill.append(h.join('')); /*�ڸ���div�� ����õ��Ŀؼ�*/  
            var TxtBox = $(":text", fill);   
            TxtBox.val(options.defValue).width(options.txtWidth)/*�����ı����С*/  
                    .addClass("ui-widget ui-widget-content")   
                    .bind("blur keyup",function(){   
                        var TxtNum = parseInt($(this).val());      
                        if(!TxtNum && TxtNum !=0){                             
                        $(this).val(options.minValue);   
                        return;   
                        }   
                        $(this).val((TxtNum> options.maxValue) ? options.maxValue :((TxtNum< options.minValue) ? options.minValue :TxtNum));                 
                    });    
            fill.width(TxtBox.width()).height(TxtBox.height()) /*���ø���div��ȣ��߶���textbox��ͬ*/  
                .css({ "position": "relative", "height": "100%" }); /*���ø���div��ʽ*/  
            $("dt", fill).addClass("ui-state-default"); /*�����еĿؼ�������ʽ*/  
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
    //�������ʱ������ʽ ---˽��     
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
    //˽�з���   
    function FineTuning(opt, obj, parent) {  
        /*FineTuning΢����ʵ�巽����ʼ*/  
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
        /*FineTuning΢����ʵ�巽������*/  
    }
})(jQuery);