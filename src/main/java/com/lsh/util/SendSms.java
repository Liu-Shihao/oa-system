package com.lsh.util;

import com.aliyun.dysmsapi20170525.models.SendSmsResponse;
import com.aliyun.tea.*;
import lombok.extern.slf4j.Slf4j;

import java.util.Random;

@Slf4j
public class SendSms {

    public static final String AccessKey_ID = "LTAI5t7w3SkEJaMQrTX8G7ow";

    public static final String AccessKey_Secret = "MJIgcsQT6AcA86ZRnQamWlaWTr4xvV";

    public static final String TEMPLATECODE = "SMS_204040109";

    public static final String SIGNNAME = "OfficeAuto";

    public static void main(String[] args) throws Exception {
//        send("15037196928","123123");
        System.out.println(randomCode());
    }

    /**
     * 使用AK&SK初始化账号Client
     * @param accessKeyId
     * @param accessKeySecret
     * @return Client
     * @throws Exception
     */
    public static com.aliyun.dysmsapi20170525.Client createClient(String accessKeyId, String accessKeySecret) throws Exception {
        com.aliyun.teaopenapi.models.Config config = new com.aliyun.teaopenapi.models.Config()
                // 必填，您的 AccessKey ID
                .setAccessKeyId(accessKeyId)
                // 必填，您的 AccessKey Secret
                .setAccessKeySecret(accessKeySecret);
        // 访问的域名
        config.endpoint = "dysmsapi.aliyuncs.com";
        return new com.aliyun.dysmsapi20170525.Client(config);
    }

    public static void send(String targetNumber, String code) throws Exception {
        com.aliyun.dysmsapi20170525.Client client = SendSms.createClient(AccessKey_ID, AccessKey_Secret);
        com.aliyun.dysmsapi20170525.models.SendSmsRequest sendSmsRequest = new com.aliyun.dysmsapi20170525.models.SendSmsRequest()
                .setSignName(SIGNNAME)
                .setTemplateCode(TEMPLATECODE)
                .setTemplateParam("{\"code\":"+code+"}")
                .setPhoneNumbers(targetNumber);
        com.aliyun.teautil.models.RuntimeOptions runtime = new com.aliyun.teautil.models.RuntimeOptions();
        try {
            SendSmsResponse sendSmsResponse = client.sendSmsWithOptions(sendSmsRequest, runtime);
            log.info("{} - {}验证码发送结果：{}",targetNumber,code,sendSmsResponse.getBody());
        } catch (TeaException error) {
            com.aliyun.teautil.Common.assertAsString(error.message);
        } catch (Exception _error) {
            TeaException error = new TeaException(_error.getMessage(), _error);
            com.aliyun.teautil.Common.assertAsString(error.message);
        }
    }


    /**
     * 生成6位数验证码
     * @return
     */
    public static String randomCode(){
        Random random = new Random();
        return String.valueOf(random.nextInt(1000000));
    }
}
