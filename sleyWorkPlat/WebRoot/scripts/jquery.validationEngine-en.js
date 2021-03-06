﻿(function($) {
	$.fn.validationEngineLanguage = function() {
	};
	$.validationEngineLanguage = {
		newLang : function() {
			$.validationEngineLanguage.allRules = {
				"required" : { // Add your regex rules here, you can take
								// telephone as an example
					"regex" : "none",
					"alertText" : "* required",
					"alertTextCheckboxMultiple" : "* Please select an option",
					"alertTextCheckboxe" : "* This checkbox is required"
				},
				"length" : {
					"regex" : "none",
					"alertText" : "*Between ",
					"alertText2" : " and ",
					"alertText3" : " characters allowed"
				},
				"maxCheckbox" : {
					"regex" : "none",
					"alertText" : "* Checks allowed Exceeded"
				},
				"minCheckbox" : {
					"regex" : "none",
					"alertText" : "* Please select ",
					"alertText2" : " options"
				},
				"confirm" : {
					"regex" : "none",
					"alertText" : "* Your field is not matching"
				},
				"telephone" : {
					"regex" : "/^[0-9\-\(\)\ ]+$/",
					"alertText" : "* Invalid phone number"
				},
				"email" :{
					"regex" : "/^[a-zA-Z0-9_\.\-]+\@([a-zA-Z0-9\-]+\.)+\.[a-zA-Z0-9]{2,4}$/",
					"alertText" : "* Invalid email address"
				},
				"date" : {
					"regex" : "/^[0-9]{4}\-\[0-9]{1,2}\-\[0-9]{1,2}$/",
					"alertText" : "* Date must be in YYYY-MM-DD format"
				},
				"onlyNumber" : {
					"regex" : "/^[0-9\ ]+$/",
					"alertText" : "* Numbers only"
				},
				"noSpecialCaracters" : {
					"regex" : "/^[0-9a-zA-Z]+$/",
					"alertText" : "* No special caracters allowed"
				},
				"ajaxUser" : {
					"file" : "validateUser.php",
					"extraData" : "name=eric",
					"alertTextOk" : "* This user is available",
					"alertTextLoad" : "* Loading, please wait",
					"alertText" : "* This user is already taken"
				},
				"ajaxName" : {
					"file" : "validateUser.php",
					"alertText" : "* This name is already taken",
					"alertTextOk" : "* This name is available",
					"alertTextLoad" : "* Loading, please wait"
				},
				"onlyLetter" : {
					"regex" : "/^[a-zA-Z\ \']+$/",
					"alertText" : "* Letters only"
				},
				"validate2fields" : {
					"nname" : "validate2fields",
					"alertText" : "* You must have a firstname and a lastname"
				},
				"moneyNumber" : {
					"regex" : "/^[0-9\ ]+$/",
					"alertText" : "* Money only"
				},
				"currency" : {
					"regex" : "/^([+-])?(\\d+(,\\d\\d\\d)*(\\.\\d{1,2})?|\\d+(\\.\\d{1,2})?)$/",
					"alertText" : "* 请输入有效货币（可以是千分位格式，最多两位小数）"
				}
			}

		}
	}
})(jQuery);

$(document).ready(function() {
	$.validationEngineLanguage.newLang()
});