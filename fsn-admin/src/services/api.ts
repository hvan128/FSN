import axios from "axios";
import storage from "./storage";

const instance = axios.create({
  baseURL: process.env.NEXT_PUBLIC_CONSUMER_SERVICE,
  headers: {
    'Content-Type': 'application/json'
  },
});

instance.interceptors.request.use(
  async (config : any) => {
    const token = storage.getLocalAccessToken();
    if (token) {
      config.headers["Authorization"] = 'Bearer ' + token;
    }
    return config;
  },
  (error: any) => {
    return Promise.reject(error);
  }
);


export default instance;