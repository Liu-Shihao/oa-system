<template>
  <div class="register">
    <el-form
      ref="registerForm"
      :model="registerForm"
      :rules="registerRules"
      class="register-form"
    >
      <h3 class="title">办公自动化系统</h3>
      <el-form-item prop="username">
        <el-input
          v-model="registerForm.username"
          type="text"
          auto-complete="off"
          placeholder="账号"
        >
          <svg-icon
            slot="prefix"
            icon-class="user"
            class="el-input__icon input-icon"
          />
        </el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input
          v-model="registerForm.password"
          type="password"
          auto-complete="off"
          placeholder="密码"
          @keyup.enter.native="handleRegister"
        >
          <svg-icon
            slot="prefix"
            icon-class="password"
            class="el-input__icon input-icon"
          />
        </el-input>
      </el-form-item>
      <el-form-item prop="confirmPassword">
        <el-input
          v-model="registerForm.confirmPassword"
          type="password"
          auto-complete="off"
          placeholder="确认密码"
          @keyup.enter.native="handleRegister"
        >
          <svg-icon
            slot="prefix"
            icon-class="password"
            class="el-input__icon input-icon"
          />
        </el-input>
      </el-form-item>

      <el-form-item prop="phoneNumber">
        <el-input
          v-model="registerForm.phoneNumber"
          type="text"
          auto-complete="off"
          placeholder="手机号码"
        >
          <svg-icon
            slot="prefix"
            icon-class="user"
            class="el-input__icon input-icon"
          />
        </el-input>
      </el-form-item>

      <el-form-item prop="code" v-if="captchaEnabled">
        <el-input
          v-model="registerForm.code"
          auto-complete="off"
          placeholder="图片验证码"
          style="width: 63%"
          @keyup.enter.native="handleRegister"
        >
          <svg-icon
            slot="prefix"
            icon-class="validCode"
            class="el-input__icon input-icon"
          />
        </el-input>

        <div class="register-code">
          <img :src="codeUrl" @click="getCode" class="register-code-img" />
        </div>
      </el-form-item>

      <el-form-item prop="smsCode" v-if="captchaEnabled" size="large">
        <el-input
          v-model="registerForm.smsCode"
          auto-complete="off"
          placeholder="短信验证码"
          style="width: 63%; margin-right: 10px"
          @keyup.enter.native="handleRegister"
        >
          <svg-icon
            slot="prefix"
            icon-class="validCode"
            class="el-input__icon input-icon"
          />
        </el-input>

        <el-button
          :sending="sending"
          type="primary"
          size="small"
          style="width: 33%; text-align: center"
          @click.native.prevent="sendSms"
        >
          <span v-if="!sending">发送短信验证码</span>
          <span v-else>发 送 中...</span>
        </el-button>
      </el-form-item>

      <el-form-item style="width: 100%">
        <el-button
          :loading="loading"
          size="medium"
          type="primary"
          style="width: 100%"
          @click.native.prevent="handleRegister"
        >
          <span v-if="!loading">注 册</span>
          <span v-else>注 册 中...</span>
        </el-button>
        <div style="float: right">
          <router-link class="link-type" :to="'/login'"
            >使用已有账户登录</router-link
          >
        </div>
      </el-form-item>
    </el-form>
    <!--  底部  -->
    <div class="el-register-footer">
      <!-- <span>Copyright © 2018-2023 ruoyi.vip All Rights Reserved.</span> -->
    </div>
  </div>
</template>

<script>
import { getCodeImg, register,getSmsCode } from "@/api/login";

export default {
  name: "Register",
  data() {
    const equalToPassword = (rule, value, callback) => {
      if (this.registerForm.password !== value) {
        callback(new Error("两次输入的密码不一致"));
      } else {
        callback();
      }
    };
    return {
      codeUrl: "",
      registerForm: {
        username: "",
        password: "",
        phoneNumber: "",
        confirmPassword: "",
        code: "",
        smsCode: "",
        uuid: "",
      },
      registerRules: {
        username: [
          { required: true, trigger: "blur", message: "请输入您的账号" },
          {
            min: 2,
            max: 20,
            message: "用户账号长度必须介于 2 和 20 之间",
            trigger: "blur",
          },
        ],
        password: [
          { required: true, trigger: "blur", message: "请输入您的密码" },
          {
            min: 5,
            max: 20,
            message: "用户密码长度必须介于 5 和 20 之间",
            trigger: "blur",
          },
        ],
        confirmPassword: [
          { required: true, trigger: "blur", message: "请再次输入您的密码" },
          { required: true, validator: equalToPassword, trigger: "blur" },
        ],
        code: [{ required: true, trigger: "change", message: "请输入验证码" }],
        phoneNumber: [{ required: true, trigger: "change", message: "请输入手机号码" }],
      },
      loading: false,
      sending: false,
      captchaEnabled: true,
    };
  },
  created() {
    this.getCode();
  },
  methods: {
    getCode() {
      getCodeImg().then((res) => {
        this.captchaEnabled =
          res.captchaEnabled === undefined ? true : res.captchaEnabled;
        if (this.captchaEnabled) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.registerForm.uuid = res.uuid;
        }
      });
    },
    sendSms() {
      // this.$refs.registerForm.validate((valid) => {
      //   if (valid) {
          this.sending = true;
          getSmsCode(this.registerForm)
            .then((res) => {
              // console.log(res)
              if(res.code === 200){
                // console.log(res.uuid)
                this.registerForm.uuid = res.uuid
                console.log('验证码发送成功')
                
                this.$alert(
                "<font color='red'>验证码发送成功 </font>",
                "系统提示",
                {
                  dangerouslyUseHTMLString: true,
                  type: "success",
                }
                )
                .then(() =>{
                 
                })
                .catch(() => {});
                this.sending = false;
                
              }else{
                console.log('验证码发送失败')
                this.$alert(
                "<font color='red'>网络错误 </font>",
                "系统提示",
                {
                  dangerouslyUseHTMLString: true,
                  type: "error",
                }
                )
              }
              // const username = this.registerForm.username;
            
                
            })
            .catch(() => {
              this.sending = false;
              if (this.captchaEnabled) {
                this.getCode();
              }
            });
      //   }
      // });

     
    },
    handleRegister() {
      this.$refs.registerForm.validate((valid) => {
        if (valid) {
          this.loading = true;
          register(this.registerForm)
            .then((res) => {
              const username = this.registerForm.username;
              this.$alert(
                "<font color='red'>恭喜你，您的账号 " +
                  username +
                  " 注册成功！</font>",
                "系统提示",
                {
                  dangerouslyUseHTMLString: true,
                  type: "success",
                }
              )
                .then(() => {
                  this.$router.push("/login");
                })
                .catch(() => {});
            })
            .catch(() => {
              this.loading = false;
              if (this.captchaEnabled) {
                this.getCode();
              }
            });
        }
      });
    },
  },
};
</script>

<style rel="stylesheet/scss" lang="scss">
.register {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  background-image: url("../assets/images/login-background.jpg");
  background-size: cover;
}
.title {
  margin: 0px auto 30px auto;
  text-align: center;
  color: #707070;
}

.register-form {
  border-radius: 6px;
  background: #ffffff;
  width: 400px;
  padding: 25px 25px 5px 25px;
  .el-input {
    height: 38px;
    input {
      height: 38px;
    }
  }
  .input-icon {
    height: 39px;
    width: 14px;
    margin-left: 2px;
  }
}
.register-tip {
  font-size: 13px;
  text-align: center;
  color: #bfbfbf;
}
.register-code {
  width: 33%;
  height: 38px;
  float: right;
  img {
    cursor: pointer;
    vertical-align: middle;
  }
}
.el-register-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
}
.register-code-img {
  height: 38px;
}
</style>
