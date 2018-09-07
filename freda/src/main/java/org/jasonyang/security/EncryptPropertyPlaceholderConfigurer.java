package org.jasonyang.security;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.jasonyang.utils.EncryptUtil;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanInitializationException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import java.util.Properties;

/**
 * 通过继承spring配置类并重写处理方法实现密文解密
 * Created by jason on 2017/7/18.
 *
 * @author jason
 */
public class EncryptPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {
    Logger logger = Logger.getLogger(EncryptPropertyPlaceholderConfigurer.class);

    @Override
    protected void processProperties(ConfigurableListableBeanFactory beanFactory, Properties props) throws BeansException {
        try {
            String username = props.getProperty("username");
            if (StringUtils.isNotBlank(username)) {
                props.setProperty("username", EncryptUtil.decode(username));
            }

            String password = props.getProperty("password");
            if (StringUtils.isNotBlank(password)) {
                props.setProperty("password", EncryptUtil.decode(password));
            }
            super.processProperties(beanFactory, props);
        } catch (Exception e) {
            logger.error("encrypt error!", e);
            throw new BeanInitializationException(e.getMessage());
        }
    }
}
