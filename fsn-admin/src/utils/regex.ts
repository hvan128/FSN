
export function validatePhone() {
  return /^[0-9]*$/;
}

export function validatePhoneBhutan() {
  return /^(16|17|77)\d{6}$/;
}

export function validatePhoneLocal() {
  return /^([0-9]{4,8})$/;
}

export function validateAppVersion() {
  return /^\d+(\.\d+){2}$/;
}

export function validateNoNumNoSCharacter() {
  return /^[\p{L}\p{M}\s]+$/u;
}

export function validateNoNumNoSCharacterNoSpace() {
  return /^(?=\S+$)(?=^.{6,32}$)[A-Za-z]+$/;
}

export function validateEmail(email: any) {
  return /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(email);
}

export function validateIdentifyCitizenNumber(number: any) {
  return /^([0-9]{12})$/.test(number);
}

export function validateAccount(account: any) {
  return /(9704)+([0-9]{12,16})\b/.test(account);
}

export function validatePin6Length(pin: any) {
  return /^([0-9]{6})$/.test(pin);
}

export function validateName(name: any) {
  return /^[aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆ fFgGhHiIìÌỉỈĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTu UùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴz]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/.test(
    name
  );
}
export function validateNumber(number: any) {
  return /^[0-9]{1,}([.][0-9]{0,})?$/.test(number);
}

export function validateApproved(number: any) {
  return /^([0-1]{1})$/.test(number);
}

export function validateUserName(userName: any) {
  return /^[A-Za-z0-9]{10,32}$/.test(userName);
}

export function validateSalary(salary: any) {
  return /^[1-9][0-9]{6,10}$/.test(salary);
}

export function validateCompany(company: any) {
  return /^[.@&]?[a-zA-Z0-9 ]+[ !.@&()]?[ a-zA-Z0-9!()]+/.test(company);
}

export function validatePassword(password : string) {
  if (password) {
    return /^(?=.*[a-z])(?=.*[A-Z]).{10,32}$/.test(password);
  }
  return /^(?=.*[a-z])(?=.*[A-Z]).{10,32}$/
}


export function validateLink(link?: any) {
  if (link) {
    return /^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_+.~#?&/=]*)$/;
  }
  return /^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_+.~#?&/=]*)$/;
}
export function validateAddress(address: any) {
  return /^[\w\s ,.]+$/.test(address);
}

export function validateCidNumber() {
  return /^[A-Za-z0-9]+$/;
}
