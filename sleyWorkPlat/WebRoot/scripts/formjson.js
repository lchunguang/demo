$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};

/**
 * 突出显示错误的输入域
 */
$.fn.applyErrors = function(es) {
	this.map(function() {
		$.each(this.elements, function() {
			var currElem = this;
			$(currElem).css('border-color', ''); //清除突出显示
			$(currElem).nextAll('div').text(''); //清除错误信息
			$.each(es, function() {
				if (this.element == currElem.name) {
					$(currElem).css('border-color', 'red'); //突出显示
					$(currElem).nextAll('div').text(this.message); //错误信息
				}
			})
		})
	});
};