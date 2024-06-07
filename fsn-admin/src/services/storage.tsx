class Storage {
  getLocalRefreshToken() {
    return localStorage.getItem('refreshToken');
  }
  getLocalAccessToken() {
    return localStorage.getItem('accessToken');
  }
  getLocalUserId() {
    return localStorage.getItem('userId');
  }
  getLocalListService() {
    const listServices = localStorage.getItem('listService');
    return JSON.parse(listServices!);
  }
  updateLocalAccessToken(accessToken : string) {
    localStorage.setItem('accessToken', accessToken);
  }
  updateLocalRefreshToken(refreshToken : string) {
    localStorage.setItem('refreshToken', refreshToken);
  }
  updateLocalUserId(userId: string) {
    localStorage.setItem('userId', userId);
  }
  updateLocalListService(listServices : any) {
    localStorage.setItem('listService', JSON.stringify(listServices));
  }
  removeAccessToken() {
    localStorage.removeItem('accessToken');
  }
  removeRefreshToken() {
    localStorage.removeItem('refreshToken');
  }
  removeUserInfoToLocalStorage() {
    localStorage.removeItem('userInfor');
  }
  clearLocal() {
    this.removeAccessToken();
    this.removeRefreshToken();
    this.removeUserInfoToLocalStorage();
  }
  saveUserInfoToLocalStorage(user: any) {
    localStorage.setItem('userInfor', JSON.stringify(user));
  }
  getUserInforFromLocalStorage() {
    const user = localStorage.getItem('userInfor');
    return JSON.parse(user!);
  }
}

export default new Storage();
