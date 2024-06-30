class Storage {
  getLocalRefreshToken() {
    if (typeof window !== 'undefined') {
      return localStorage.getItem('refreshToken');
    }
  }

  getLocalAccessToken() {
    if (typeof window !== 'undefined') {
      return localStorage.getItem('accessToken');
    }
  }

  getLocalUserId() {
    if (typeof window !== 'undefined') {
      return localStorage.getItem('userId');
    }
  }

  getLocalListService() {
    if (typeof window !== 'undefined') {
      const listServices = localStorage.getItem('listService');
      return listServices ? JSON.parse(listServices) : null;
    }
  }

  updateLocalAccessToken(accessToken: string) {
    if (typeof window !== 'undefined') {
      localStorage.setItem('accessToken', accessToken);
    }
  }

  updateLocalRefreshToken(refreshToken: string) {
    if (typeof window !== 'undefined') {
      localStorage.setItem('refreshToken', refreshToken);
    }
  }

  updateLocalUserId(userId: string) {
    if (typeof window !== 'undefined') {
      localStorage.setItem('userId', userId);
    }
  }

  updateLocalListService(listServices: any) {
    if (typeof window !== 'undefined') {
      localStorage.setItem('listService', JSON.stringify(listServices));
    }
  }

  removeAccessToken() {
    if (typeof window !== 'undefined') {
      localStorage.removeItem('accessToken');
    }
  }

  removeRefreshToken() {
    if (typeof window !== 'undefined') {
      localStorage.removeItem('refreshToken');
    }
  }

  removeUserInfoToLocalStorage() {
    if (typeof window !== 'undefined') {
      localStorage.removeItem('userInfor');
    }
  }

  clearLocal() {
    if (typeof window !== 'undefined') {
      this.removeAccessToken();
      this.removeRefreshToken();
      this.removeUserInfoToLocalStorage();
    }
  }

  saveUserInfoToLocalStorage(user: any) {
    if (typeof window !== 'undefined') {
      localStorage.setItem('userInfor', JSON.stringify(user));
    }
  }

  getUserInforFromLocalStorage() {
    if (typeof window !== 'undefined') {
      const user = localStorage.getItem('userInfor');
      return user ? JSON.parse(user) : null;
    }
  }
}

export default new Storage();
