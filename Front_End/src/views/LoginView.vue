<script setup>
import { ref } from 'vue'
import http from "@/common/axios.js";
import { useAuthStore } from '@/stores/authStore';
import { useRouter } from 'vue-router'

const { authStore, setLogin } = useAuthStore()
const router = useRouter()

const login = async () => {
  // #1 Not JSON Way : application/x-www-form-urlencoded;charset=UTF-8

  // backend 는 @RequestBody X
  // let options = {
  //   headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8' }
  // }

  // application/x-www-form-urlencoded 일 때 param 은 URLSearchParams() 를 이용
  // const params = new URLSearchParams();
  // params.append('userId', authStore.userId);
  // params.append('userPassword', authStore.userPassword);

  // #2 JSON Way : application/json
  let loginObj = {
    userId: authStore.userId,
    userPassword: authStore.userPassword,
  };


  try {
    console.log(loginObj)
    // console.log("http:",http)
    // #1
    // let {data} = await  http.post('/login', params, options );

    // #2
    let { data } = await http.post("/login", loginObj);

    console.log("LoginVue: data : ");
    console.log(data);
    console.log(data.userName);

    if (data.result == "success") {
      setLogin({ isLogin: true, userName: data.userName, userProfileImageUrl: data.userProfileImageUrl });
      // board 로 이동
      router.push("/");
    } else if (data.result == "fail") {
      isFail.value = true
      console.log('아이디/비밀번호 일치하는 데이터 없음');
    }
  } catch (error) {
    // LoginController 에서 ResponseEntity 로 404 보내면 여기로 떨어진다.
    // isFail.value = true 
    console.log("LoginVue: error : ");
    console.log(error);
    console.log('오류발생');
  }
}

// 로그인 실패시 메세지 표시여부
const isFail = ref(false)

</script>

<template>
  <header class="masthead">
    <div class="container px-4 px-lg-5 h-100">
      <div class="row gx-4 gx-lg-5 align-items-center justify-content-center text-center">

        <div class="logo-box d-flex justify-content-center align-self-center">
          <h1 class="logo"><a href="/">TRIP MARK</a></h1>
        </div>

        <div class="d-flex justify-content-center align-self-center">
          <div class="login-box g-col-3">
            <form action="">


              <label for="inp" class="inp">
                <input type="text" placeholder="아이디" v-model="authStore.userId" required>
              </label>

              <label for="inp" class="inp">
                <input type="password" placeholder="비밀번호" v-model="authStore.userPassword" required>
              </label>

              <!-- message -->
              <div v-show="isFail" class="login-fail non-click-text">
                아이디 또는 비밀번호가 일치하지 않습니다.
              </div>

              <!-- 로그인 버튼 -->
              <input @click="login" type="button" id="btn" value="로그인"><br>
            </form>
            <div class="mb-4">
              <router-link to="/join" class="click-text-large">계정만들기</router-link>
            </div>
            <div class="non-click-text">
              비밀번호를 잊어버리셨나요? <a class="click-text" href="#none">비밀번호 찾기</a>
            </div>
          </div>
        </div>


      </div>
    </div>
  </header>
</template>

<style scoped>
.logo-box {
  margin-top: 10vh
}

header.masthead {
  padding-top: 10rem;
  padding-bottom: calc(10rem - 4.5rem);
  background: linear-gradient(to bottom, rgba(92, 77, 66, 0.200) 0%, rgba(92, 77, 66, 0.8) 100%), url(/img/bg-masthead.jpg);
  background-position: center;
  background-repeat: no-repeat;
  background-attachment: scroll;
  background-size: cover;
}


/* 이미지 미리 다운로드 */
body::after {
  /* 소스만 다운받고 화면은 나태내지 않는다. (숨김 처리) */
  position: absolute;
  width: 0;
  height: 0;
  overflow: hidden;
  z-index: -1;

  /* load images */
  content: url(/img/bg-masthead.jpg);
  /* 필요한 이미지 소스들 다운 */
}


.click-text-large {
  font-size: 14px;
}

.logo {
  font-weight: 700;
  margin-bottom: 40px;
}

.logo a {
  text-decoration: none;
  color: rgb(255, 255, 255);
}

.non-click-text {
  font-size: 12px;
  color: #9B9B9B;
}

.login-fail {
  color: #dc3545;
}

.click-text {
  color: #707070;
}


.login-box {
  margin: auto;
  width: 400px;
  /* width: 500px; */
  background-color: #f3f3f3;
  border-radius: 20px;
  text-align: center;
  padding: 50px;
}

.login-box input {
  width: 100%;
  padding: 10px;
  box-sizing: border-box;
  border-radius: 10px;
}

.input-text {
  margin-bottom: 10px;
}

.login-box #btn {
  margin-top: 30px;
  margin-bottom: 10px;
  color: white;
  border-radius: 10px;
  border: 0;
}

.login-box a {
  text-decoration: none;
  font-size: 12px;
}




/* Button CSS */
.login-box #btn {
  background: #f4623a;
  border: 1px solid #f4623a;
  border-radius: 6px;
  box-shadow: rgba(0, 0, 0, 0.1) 1px 2px 4px;
  box-sizing: border-box;
  color: #FFFFFF;
  cursor: pointer;
  display: inline-block;
  line-height: 16px;
  min-height: 40px;
  outline: 0;
  padding: 12px 14px;
  text-align: center;
  text-rendering: geometricprecision;
  text-transform: none;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: middle;
}

.login-box #btn:hover,
.login-box #btn:active {
  background-color: initial;
  background-position: 0 0;
  color: #f4623a;
}

.login-box #btn:active {
  opacity: .5;
}


.inp {
  position: relative;
  margin: auto;
  width: 100%;
  height: 53px;
}

.inp .border {
  position: absolute;
  left: 0;
  bottom: 0;
  height: 18px;
  fill: none;

}


.inp input {
  -webkit-appearance: none;
  width: 100%;
  border-width: 0px 0px 2px 0px;
  border-color: #c8ccd4;
  font-family: inherit;
  padding: 0;
  height: 48px;
  font-size: 16px;
  font-weight: 500;
  background: none;
  border-radius: 0;
  color: #223254;
}

.inp input:focus {
  outline: none;
  border-color: #f4623a;
}


::placeholder {
  color: #9098a9;
}
</style>



