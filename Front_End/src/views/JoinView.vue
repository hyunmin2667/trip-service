<script setup>
import http from "@/common/axios.js";
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const userName = ref('')
const userId = ref('')
const userPassword = ref('')
const userPasswordCheck = ref('')

// focus
const isUserNameFocus = ref(false)
const isUserIdFocus = ref(false)
const isUserPasswordFocus = ref(false)
const isUserPasswordCheckFocus = ref(false)

// validation
const isUserNameValid = ref(false)
const isUserIdValid = ref(false)
const isUserPasswordValid = ref(false)
const isUserPasswordCheckValid = ref(false)

// Focus and Invalid
const isUserNameFocusAndValid = computed(() => isUserNameFocus.value && isUserNameValid.value)
const isUserNameFocusAndInvalid = computed(() => isUserNameFocus.value && !isUserNameValid.value)
const isUserIdFocusAndValid = computed(() => isUserIdFocus.value && isUserIdValid.value)
const isUserIdFocusAndInValid = computed(() => isUserIdFocus.value && !isUserIdValid.value)

// Focus and Valid
const isUserPasswordFocusAndValid = computed(() => isUserPasswordFocus.value && isUserPasswordValid.value)
const isUserPasswordFocusAndInvalid = computed(() => isUserPasswordFocus.value && !isUserPasswordValid.value)
const isUserPasswordCheckFocusAndValid = computed(() => isUserPasswordCheckFocus.value && isUserPasswordCheckValid.value)
const isUserPasswordCheckFocusAndInvalid = computed(() => isUserPasswordCheckFocus.value && !isUserPasswordCheckValid.value)


const validateUserName = () => {
  let regexp = /(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
  isUserNameValid.value = regexp.test(userName.value) ? true : false;
  console.log(isUserNameValid.value);
}
const validateId = () => {
  let regexp = /[a-z]+[a-z0-9]{5,19}$/;
  isUserIdValid.value = regexp.test(userId.value) ? true : false;
  console.log(isUserIdValid.value);
}
const validatePassword = () => {
  let regexp = /(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
  isUserPasswordValid.value = regexp.test(userPassword.value) ? true : false;
}
const validatePasswordCheck = () => {
  isUserPasswordCheckValid.value = userPassword.value == userPasswordCheck.value ? true : false;
}


const register = async () => {
  if (!isUserIdValid || !isUserPasswordValid || !isUserPasswordCheckValid) return;

  let registerObj = {
    userName: userName.value,
    userId: userId.value,
    userPassword: userPassword.value,
  };
  try {
    let { data } = await http.post("/users", registerObj); // JSON Request, { params : registerObj } X params 를 쓰면 get => query string
    console.log("UsersPage: data : ");
    console.log(data.result);

    alert('회원가입을 축하합니다. 로그인 페이지로 이동합니다.');
    router.push("/login");
  } catch (error) {
    console.log("UsersPage: error : ");
    console.log(error);
    alert('서버에 문제가 발생했습니다.')
  }
}

</script>

<template>
  <header class="masthead">
    <div class="container px-4 px-lg-5">
      <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">

        <div class="logo-box d-flex justify-content-center align-self-center">
          <h1 class="logo"><a href="/">Trip Mark</a></h1>
        </div>

        <div class="d-flex justify-content-center align-self-center">
          <div class="login-box ">
            <form action="">

              <!-- 이름 -->
              <label for="inp" class="inp">
                <input type="text" placeholder="이름" required pattern="(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$"
                  :class="{ 'is-valid': isUserNameFocusAndValid, 'is-invalid': isUserNameFocusAndInvalid }"
                  v-model="userName" @input="validateUserName" @focus="isUserNameFocus = true">
                <svg width="300px" height="18px" viewBox="0 0 300 18" class="border">
                  <path
                    d="M0,12 L243.166144,12 C237.261379,12 247.899687,12 245.141066,12 C256.003135,12 261.9279,12 269.827586,12 C277.727273,12 284.639498,12 294.514107,12 C301.097179,12 301.755486,12 296.489028,12">
                  </path>
                </svg>
                <svg width="14px" height="12px" viewBox="0 0 14 12" class="check">
                  <path d="M1 7 5.5 11 L13 1"></path>
                </svg>
                <div class="invalid-feedback login-fail non-click-text">
                  잘못된 이름입니다.
                </div>
              </label>

              <!-- 아이디 -->
              <label for="inp" class="inp">
                <input type="text" placeholder="아이디" required pattern="[a-z]+[a-z0-9]{5,19}$"
                  :class="{ 'is-valid': isUserIdFocusAndValid, 'is-invalid': isUserIdFocusAndInValid }" v-model="userId"
                  @input="validateId" @focus="isUserIdFocus = true">
                <svg width="300px" height="18px" viewBox="0 0 300 18" class="border">
                  <path
                    d="M0,12 L243.166144,12 C237.261379,12 247.899687,12 245.141066,12 C256.003135,12 261.9279,12 269.827586,12 C277.727273,12 284.639498,12 294.514107,12 C301.097179,12 301.755486,12 296.489028,12">
                  </path>
                </svg>
                <svg width="14px" height="12px" viewBox="0 0 14 12" class="check">
                  <path d="M1 7 5.5 11 L13 1"></path>
                </svg>
                <div class="invalid-feedback login-fail non-click-text">
                  5 ~ 19자 영문, 숫자로 이루어진 아이디를 입력해주세요
                </div>
              </label>
              <!-- <div class="invalid-feedback login-fail non-click-text">
                이미 존재하는 아이디입니다.
              </div> -->

              <!-- 비밀번호 -->
              <label for="inp" class="inp">
                <input type="password" placeholder="비밀번호" required pattern="(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$"
                  :class="{ 'is-valid': isUserPasswordFocusAndValid, 'is-invalid': isUserPasswordFocusAndInvalid }"
                  v-model="userPassword" @input="validatePassword" @focus="isUserPasswordFocus = true">
                <svg width="300px" height="18px" viewBox="0 0 300 18" class="border">
                  <path
                    d="M0,12 L243.166144,12 C237.261379,12 247.899687,12 245.141066,12 C256.003135,12 261.9279,12 269.827586,12 C277.727273,12 284.639498,12 294.514107,12 C301.097179,12 301.755486,12 296.489028,12">
                  </path>
                </svg>
                <svg width="14px" height="12px" viewBox="0 0 14 12" class="check">
                  <path d="M1 7 5.5 11 L13 1"></path>
                </svg>
                <div class="invalid-feedback login-fail non-click-text">
                  8 ~ 16자 영문, 숫자로 이루어진 비밀번호를 입력해주세요
                </div>
              </label>

              <!-- 비밀번호 확인 -->
              <label for="inp" class="inp">
                <input type="password" placeholder="비밀번호 확인" required pattern="(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$"
                  :class="{ 'is-valid': isUserPasswordCheckFocusAndValid, 'is-invalid': isUserPasswordCheckFocusAndInvalid }"
                  v-model="userPasswordCheck" @input="validatePasswordCheck" @focus="isUserPasswordCheckFocus = true">
                <svg width="300px" height="18px" viewBox="0 0 300 18" class="border">
                  <path
                    d="M0,12 L243.166144,12 C237.261379,12 247.899687,12 245.141066,12 C256.003135,12 261.9279,12 269.827586,12 C277.727273,12 284.639498,12 294.514107,12 C301.097179,12 301.755486,12 296.489028,12">
                  </path>
                </svg>
                <svg width="14px" height="12px" viewBox="0 0 14 12" class="check">
                  <path d="M1 7 5.5 11 L13 1"></path>
                </svg>
                <div class="invalid-feedback login-fail non-click-text">
                  비밀번호가 일치하지 않습니다.
                </div>
              </label>

              <input type="button" @click="register" id="btn" value="가입완료"><br>
              <div class="non-click-text">
                <router-link to="/login" class="click-text">로그인 페이지</router-link>
              </div>
            </form>





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

.logo a {
  text-decoration: none;
  color: rgb(255, 255, 255);
}

.click-text-large {
  font-size: 14px;
}

.logo {
  font-weight: 700;
  margin-bottom: 40px;
}

.non-click-text {
  font-size: 12px;
  color: #9B9B9B;
}

.login-fail {
  color: #dc3545;
  text-align: left;
}

.click-text {
  color: #707070;
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


.login-box {
  margin: auto;
  width: 400px;
  background-color: #f3f3f3;
  border-radius: 20px;
  text-align: center;
  padding: 50px;
}

.login-box input {
  width: 100%;
  padding: 10px;
  box-sizing: border-box;
  border: none;
}

.input-text {
  margin-bottom: 10px;
}

.login-box #btn {
  margin-top: 30px;
  color: white;
  border-radius: 10px;
}

.login-box a {
  text-decoration: none;
  color: #9B9B9B;
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
  margin-bottom: 10px;
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
  max-width: 300px;
  height: 53px;
}

.inp .border {
  position: absolute;
  left: 0;
  bottom: 0;
  height: 18px;
  fill: none;
}

.inp .border path {
  stroke: #c8ccd4;
  stroke-width: 2;
}

.inp .border path d {
  transition: all 0.2s ease;
}

.inp .check {
  position: absolute;
  top: 20px;
  right: 20px;
  fill: none;
  transform: translate(0, 9px) scale(0);
  transition: all 0.3s cubic-bezier(0.5, 0.9, 0.25, 1.3);
  transition-delay: 0.15s;
}

.inp .check path {
  stroke: #f4623a;
  stroke-width: 2;
}

.inp input {
  -webkit-appearance: none;
  /* Safari and Chrome */
  width: 100%;
  border: 0;
  font-family: inherit;
  padding: 0;
  height: 48px;
  font-size: 16px;
  font-weight: 500;
  background: none;
  border-radius: 0;
  color: #223254;
  transition: all 0.15s ease;
}

.inp input:focus {
  outline: none;
}

.inp input:focus+.border path {
  stroke: #f4623a;
}

.inp input:valid+.border path {
  animation: elasticInput 0.8s ease forwards;
}

.inp input:valid+.border+.check {
  transform: translate(0, 0) scale(1);
}

::placeholder {
  color: #9098a9;
}

@-moz-keyframes elasticInput {
  33% {
    d: path("M0,12 L226,12 C220,12 220.666667,12 228,12 C239,12 245,1 253,1 C261,1 268,12 278,12 C284.666667,12 285.333333,12 280,12");
  }

  66% {
    d: path("M0,12 L226,12 C220,12 220.666667,12 228,12 C239,12 245,17 253,17 C261,17 268,12 278,12 C284.666667,12 285.333333,12 280,12");
  }
}

@-webkit-keyframes elasticInput {
  33% {
    d: path("M0,12 L226,12 C220,12 220.666667,12 228,12 C239,12 245,1 253,1 C261,1 268,12 278,12 C284.666667,12 285.333333,12 280,12");
  }

  66% {
    d: path("M0,12 L226,12 C220,12 220.666667,12 228,12 C239,12 245,17 253,17 C261,17 268,12 278,12 C284.666667,12 285.333333,12 280,12");
  }
}

@-o-keyframes elasticInput {
  33% {
    d: path("M0,12 L226,12 C220,12 220.666667,12 228,12 C239,12 245,1 253,1 C261,1 268,12 278,12 C284.666667,12 285.333333,12 280,12");
  }

  66% {
    d: path("M0,12 L226,12 C220,12 220.666667,12 228,12 C239,12 245,17 253,17 C261,17 268,12 278,12 C284.666667,12 285.333333,12 280,12");
  }
}

@keyframes elasticInput {
  33% {
    d: path("M0,12 L226,12 C220,12 220.666667,12 228,12 C239,12 245,1 253,1 C261,1 268,12 278,12 C284.666667,12 285.333333,12 280,12");
  }

  66% {
    d: path("M0,12 L226,12 C220,12 220.666667,12 228,12 C239,12 245,17 253,17 C261,17 268,12 278,12 C284.666667,12 285.333333,12 280,12");
  }
}
</style>



