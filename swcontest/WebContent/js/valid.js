//임시
function validate_email(mem_email) {
	var pattern = new RegExp(
			/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/);
	return pattern.test(mem_email);
}
//

function validate_id(id) {
	var pattern = new RegExp(/^[a-z0-9]{5,14}$/);
	return pattern.test(id);
}

function validate_pass(pass) {
	var pattern = new RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/);
	return pattern.test(pass);
}

function validate_name(name) {
	var pattern = new RegExp(/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/);
	return pattern.test(name);
}

function validate_email(email) {
	var pattern = new RegExp(
			/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/);
	return pattern.test(email);
}

function validate_tel(tel) {
	var pattern = new RegExp(/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/);
	return pattern.test(tel);
}

function validate_res1(res1) {
	var pattern = new RegExp(/^\d{6}$/);
	return pattern.test(res1);
}

function validate_res2(res2) {
	var pattern = new RegExp(/^\d{7}$/);
	return pattern.test(res2);
}

function validate_zip(zip) {
	var pattern = new RegExp(/^\d\d\d-\d\d\d$/, /^\d{3}-\d{3}$/);
	return pattern.test(zip);
}
