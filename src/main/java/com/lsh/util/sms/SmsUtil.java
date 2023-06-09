package com.lsh.util.sms;

import com.aliyun.dysmsapi20170525.models.SendSmsResponse;
import com.aliyun.tea.TeaException;
import com.lsh.constant.CacheConstants;
import com.lsh.constant.Constants;
import com.lsh.exception.ServiceException;
import com.lsh.util.cache.HazelcastUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Base64;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@Slf4j
@Component
public class SmsUtil {

    public static final String AccessKey_ID = "TFRBSTV0N3czU2tFSmFNUXJUWDhHN293";

    public static final String AccessKey_Secret = "TUpJZ2NzUVQ2QWNBODZaUm5RYW1XbGFXVHI0eHZW";

    public static final String TEMPLATECODE = "SMS_204040109";

    public static final String SIGNNAME = "无限飓风";

    private com.aliyun.dysmsapi20170525.Client client;

    public SmsUtil() throws Exception {
        this.client = createClient(AccessKey_ID, AccessKey_Secret);
    }


    @Autowired
    HazelcastUtil hazelcastUtil;

    /**
     * 使用AK&SK初始化账号Client
     * @param accessKeyId
     * @param accessKeySecret
     * @return Client
     * @throws Exception
     */
    public com.aliyun.dysmsapi20170525.Client createClient(String accessKeyId, String accessKeySecret) throws Exception {
        com.aliyun.teaopenapi.models.Config config = new com.aliyun.teaopenapi.models.Config()
                // 必填，您的 AccessKey ID
                .setAccessKeyId(new String(Base64.getDecoder().decode(accessKeyId)))
                // 必填，您的 AccessKey Secret
                .setAccessKeySecret(new String(Base64.getDecoder().decode(accessKeySecret)));
        // 访问的域名
        config.endpoint = "dysmsapi.aliyuncs.com";
        return new com.aliyun.dysmsapi20170525.Client(config);
    }

    public void send(String targetNumber,String uuid) throws Exception {
        String code = randomCode();
        // 保存验证码信息
        String verifyKey = CacheConstants.SMS_CODE_KEY + uuid;
        hazelcastUtil.setCacheObject(verifyKey, code, Constants.SMS_EXPIRATION, TimeUnit.MINUTES);

        com.aliyun.dysmsapi20170525.models.SendSmsRequest sendSmsRequest = new com.aliyun.dysmsapi20170525.models.SendSmsRequest()
                .setSignName(SIGNNAME)
                .setTemplateCode(TEMPLATECODE)
                .setTemplateParam("{\"code\":"+code+"}")
                .setPhoneNumbers(targetNumber);
        com.aliyun.teautil.models.RuntimeOptions runtime = new com.aliyun.teautil.models.RuntimeOptions();
        try {
            log.info("{} - {} 准备发送短信验证码...",targetNumber,code);
            SendSmsResponse sendSmsResponse = client.sendSmsWithOptions(sendSmsRequest, runtime);
            if ("OK".equalsIgnoreCase(sendSmsResponse.getBody().getMessage())){
                log.info("短信验证码发送成功");
            }else {
                log.error("短信验证码发送失败");
                throw new ServiceException(sendSmsResponse.getBody().getMessage());
            }
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
    public String randomCode(){
        Random random = new Random();
        return String.valueOf(random.nextInt(1000000));
    }
}
