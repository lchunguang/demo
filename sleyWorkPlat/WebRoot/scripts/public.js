//将数据改为发布状态
$(function() {
	$(".release")
			.click(
					function() {
						window.confirm("\Do you want to release?");
						$("input:checked").parent().siblings()
								.children("label").text("Release");
						$("input:checked").parent().siblings().children("img")
								.remove();
						$("input:checked")
								.parent()
								.siblings()
								.children("a")
								.attr("href",
										"UC-SEM-SP2-initialInventory_Release.html");
						$("input:checked").attr("disabled", "disabled")
								.removeAttr("checked");
					});
});
$(function() {
	// 设置输入框获取/失去焦点时的背景色变化
	$(".text,textarea").focus(function() {
		$(this).addClass("oninput");
	}).blur(function() {
		$(this).removeClass("oninput");
	});
	// 设置只读输入框/文本域的背景色
	$(".text[readonly]").addClass("readonly");
	$("textarea[readonly]").addClass("readonly");
});

$(function() {
	// 设置鼠标悬停/移开时按钮的变化
	$(".btn").mouseover(function() {
		$(this).addClass("btn_over");
	}).mouseout(function() {
		$(this).removeClass("btn_over");
	});
});

$(function() {
	// 设置数据展示表格奇、偶行的背景色
	$(".data_tab tr:odd").addClass("odd");
	$(".data_tab tr:even").addClass("even");
	// 设置鼠标滑过时数据展示表格行背景色的变化
	$(".data_tab tr").mouseover(function() {
		$(this).addClass("over");
	}).mouseout(function() {
		$(this).removeClass("over");
	});
});

$(function() {
	// 设置数据展示表格奇、偶行的背景色
	$(".data1_tab tr:odd").addClass("odd");
	$(".data1_tab tr:even").addClass("even");
	// 设置鼠标滑过时数据展示表格行背景色的变化
	$(".data1_tab tr").mouseover(function() {
		$(this).addClass("over");
	}).mouseout(function() {
		$(this).removeClass("over");
	});
});

$(function() {
	// 点击标题，切换其下的内容
	$(function() {
		$("p.min").toggle(function() {
			$(this).addClass("max").parent().next("div").slideUp("slow");
		}, function() {
			$(this).removeClass("max").parent().next("div").slideDown("slow");
		});
	});
});
/*
 * the down is the part of select all
 */

$(document).ready(
		function() {
			$("#check_all").attr("checked", false);
			// 定义全选框的名称为$chkall
			var $chkall = $('#check_all');
			var $chkarry = $('input[type="checkbox"]').not($('#check_all'))
					.not($('input[type="checkbox"]:disabled'));// 取到除全选框的其它复选框
			// 全选框的实现函数
			$chkall.click(function() {
				var b = $(this).attr('checked');// 取到全选框的值
				$chkarry.each(function() {
					$(this).attr('checked', b);
				});// 设置其它复选框值与全选框同步 ，实现全选，取消全选功能
			});
			// 除了全选的其它复选框
			$chkarry.each(function() {
				$(this).click(
						function() {
							// 先把每个其它复选框的值赋给全选框
							$chkall.attr('checked', $(this).attr('checked'));
							// 再循环所有其它的复选框是否已经全部选择，实现全选与其它复选框出现全选情况下同步。
							// 即如果其它复选都已经选择，则全选也选择。
							$chkarry.each(function(index) {
								$chkall.attr('checked', ($chkall
										.attr('checked') && $chkarry.eq(index)
										.attr('checked')) ? true : false);
							});
						});
			});
		});

// 居中弹出窗口页面
function openWindow(iUrl, iName, iWidth, iHeight) {
	var url = '';
	var name = '';
	var w = 914;
	var h = 520;
	if (iUrl) {
		url = iUrl
	}
	if (iName) {
		name = iName
	}
	if (iWidth) {
		w = iWidth
	}
	if (iHeight) {
		h = iHeight
	}
	var l = (window.screen.availWidth - 10 - w) / 2;
	var t = (window.screen.availHeight - 30 - h) / 2;
	window
			.open(
					url,
					name,
					'height='
							+ h
							+ ',innerHeight='
							+ h
							+ ',width='
							+ w
							+ ',innerWidth='
							+ w
							+ ',top='
							+ t
							+ ',left='
							+ l
							+ ',toolbar=no,menubar=no,scrollbars=yes,resizeable=no,location=no,status=no');
}

// 无确认关闭窗口
function closeWindow() {
	window.opener = null;
	window.open("", "_self");
	window.close();
}

$(function() {
	// 点击提示输入框，出现提示信息
	$(".help").attr("title", "点击查看提示");
	// 打开不同类型的提示窗口
	$(".help_client").click(function() {
		openWindow("../WIN/WIN-CLIENT.html", "client");
	});
	$(".help_consultant").click(function() {
		openWindow("../WIN/WIN-CONSULTANT.html", "consultant");
	});
	$(".help_dealer").click(function() {
		openWindow("../WIN/WIN-DEALER.html", "dealer");
	});
	$(".help_intent").click(function() {
		openWindow("../WIN/WIN-INTENT.html", "intent");
	});
	$(".help_intent2").click(function() {
		openWindow("../WIN/WIN-INTENT_2.html", "intent2");
	});
	$(".help_msrp").click(function() {
		openWindow("../WIN/WIN-MSRP.html", "msrp");
	});
	$(".help_mac").click(function() {
		openWindow("../WIN/WIN-MAC.html", "mac");
	});
	$(".help_marketing").dblclick(function() {
		openWindow("../WIN/WIN-MARKETING.html", "marketing");
	});
	$(".help_order").click(function() {
		openWindow("../WIN/WIN-ORDER.html", "order");
	});
	$(".help_people").click(function() {
		openWindow("../WIN/WIN-PEOPLE.html", "people");
	});
	$(".help_people2").click(function() {
		openWindow("../WIN/WIN-PEOPLE_2.html", "people2");
	});
	$(".help_repair").click(function() {
		openWindow("../WIN/WIN-REPAIR.html", "repair");
	});
	$(".help_role").click(function() {
		openWindow("../WIN/WIN-ROLE.html", "role");
	});
	$(".help_station").click(function() {
		openWindow("../WIN/WIN-STATION.html", "station");
	});
	$(".help_value").click(function() {
		openWindow("../WIN/WIN-VALUE.html", "value");
	});
	$(".help_vin").click(function() {
		openWindow("../WIN/WIN-VIN.html", "vin");
	});
});

$(function() {
	// 取消遮罩 - 测试使用
	$(
			"#save,#cancel,#cancel_f,#save_s,#cancel_s,#saveDraft,#saveRelease,#cancel_add,#saveDraft_add,#saveRelease_add")
			.click(function() {
				$.unblockUI();
			});

});

// ----------------------------------------------------------
// 功能：检查身份证号码
// 参数：
// idcard
// 返回值：
// ----------------------------------------------------------
function CheckIdCard(idcard) {
	var Errors = new Array("验证通过!", "身份证号码位数不对!", "身份证号码出生日期超出范围或含有非法字符!",
			"身份证号码校验错误!", "身份证地区非法!");
	var area = {
		11 : "北京",
		12 : "天津",
		13 : "河北",
		14 : "山西",
		15 : "内蒙古",
		21 : "辽宁",
		22 : "吉林",
		23 : "黑龙江",
		31 : "上海",
		32 : "江苏",
		33 : "浙江",
		34 : "安徽",
		35 : "福建",
		36 : "江西",
		37 : "山东",
		41 : "河南",
		42 : "湖北",
		43 : "湖南",
		44 : "广东",
		45 : "广西",
		46 : "海南",
		50 : "重庆",
		51 : "四川",
		52 : "贵州",
		53 : "云南",
		54 : "西藏",
		61 : "陕西",
		62 : "甘肃",
		63 : "青海",
		64 : "宁夏",
		65 : "新疆",
		71 : "台湾",
		81 : "香港",
		82 : "澳门",
		91 : "国外"
	};
	var idcard, Y, JYM;
	var S, M;
	var idcard_array = new Array();
	idcard_array = idcard.split("");
	// 地区检验
	if (area[parseInt(idcard.substr(0, 2))] == null)
		return Errors[4];
	// 身份号码位数及格式检验
	switch (idcard.length) {
	case 15:
		if ((parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0
				|| ((parseInt(idcard.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(idcard
						.substr(6, 2)) + 1900) % 4 == 0)) {
			ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;// 测试出生日期的合法性
		} else {
			ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;// 测试出生日期的合法性
		}
		if (ereg.test(idcard))
			return Errors[0];
		else
			return Errors[2];
		break;
	case 18:
		// 18位身份号码检测
		// 出生日期的合法性检查
		// 闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
		// 平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
		if (parseInt(idcard.substr(6, 4)) % 4 == 0
				|| (parseInt(idcard.substr(6, 4)) % 100 == 0 && parseInt(idcard
						.substr(6, 4)) % 4 == 0)) {
			ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;// 闰年出生日期的合法性正则表达式
		} else {
			ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;// 平年出生日期的合法性正则表达式
		}
		if (ereg.test(idcard)) {// 测试出生日期的合法性
		// 计算校验位
			S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
					+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11]))
					* 9
					+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12]))
					* 10
					+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13]))
					* 5
					+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14]))
					* 8
					+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15]))
					* 4
					+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16]))
					* 2 + parseInt(idcard_array[7]) * 1
					+ parseInt(idcard_array[8]) * 6 + parseInt(idcard_array[9])
					* 3;
			Y = S % 11;
			M = "F";
			JYM = "10X98765432";
			M = JYM.substr(Y, 1);// 判断校验位
			if (M == idcard_array[17])
				return Errors[0]; // 检测ID的校验位
			else
				return Errors[3];
		} else
			return Errors[2];
		break;
	default:
		return Errors[1];
		break;
	}

}


//----------------------------------------------------------
//功能：根据身份证号获得出生日期
//参数：身份证号 psidno
//返回值：
//出生日期
//----------------------------------------------------------
function GetBirthday(psidno){
var birthdayno,birthdaytemp
if(psidno.length==18){
  birthdayno=psidno.substring(6,14)
}else if(psidno.length==15){
  birthdaytemp=psidno.substring(6,12)
  birthdayno="19"+birthdaytemp
}else{
  alert("错误的身份证号码，请核对！")
  return false
}
var birthday=birthdayno.substring(0,4)+"-"+birthdayno.substring(4,6)+"-"+birthdayno.substring(6,8)
return birthday    
}

//----------------------------------------------------------
//功能：根据身份证号获得性别
//参数：身份证号 psidno
//返回值：
//性别
//----------------------------------------------------------
function Getsex(psidno){
var sexno,sex
if(psidno.length==18){
  sexno=psidno.substring(16,17)
}else if(psidno.length==15){
  sexno=psidno.substring(14,15)
}else{
  alert("错误的身份证号码，请核对！")
  return false
}
var tempid=sexno%2;
if(tempid==0){
  sex='F'//
}else{
  sex='M'//
}
return sex
}

function codefans() {
	if (tip != "") {
		var box = document.getElementById("tip");
		box.style.display = "none";
	}
}
setTimeout("codefans()", 2000);//2秒，可以改动
