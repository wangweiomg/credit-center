package com.honeywen.credit.modules.sys.service;

import cn.binarywang.wx.miniapp.bean.WxMaUserInfo;
import com.honeywen.credit.common.security.Digests;
import com.honeywen.credit.common.security.shiro.session.SessionDAO;
import com.honeywen.credit.common.utils.Encodes;
import com.honeywen.credit.common.utils.StringUtils;
import com.honeywen.credit.modules.cms.service.CardService;
import com.honeywen.credit.modules.sys.dao.SysUserDao;
import com.honeywen.credit.modules.sys.entity.SysUser;
import com.honeywen.credit.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 系统类
 * @author wangwei
 * @date 2018/12/1 下午6:11
 */
@Service
public class SystemService {

    public static final String HASH_ALGORITHM = "SHA-1";
    public static final int HASH_INTERATIONS = 1024;
    public static final int SALT_SIZE = 8;

    @Autowired
    private SessionDAO sessionDao;
    @Autowired
    private SysUserDao sysUserDao;
    @Autowired
    private CardService cardService;

    public SessionDAO getSessionDao() {
        return sessionDao;
    }

    /**
     * 根据登陆名获取用户
     * @param loginName
     * @return
     */
    public SysUser getUserByLoginName(String loginName) {
        return UserUtils.getByLoginName(loginName);
    }


    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void saveUser(SysUser user) {
        SysUser currentUser = UserUtils.getUser();
        user.setCreateBy(currentUser.getId());
        user.setStatus(SysUser.StatusEnum.ON.getValue());

        sysUserDao.save(user);
    }

    /**
     * 保存/更新微信用户
     */
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public SysUser saveWxUser(String openId, String unionId) {

        SysUser user = UserUtils.getByWxOpenId(openId);

        if (user != null) {
            return user;
        }

        user = new SysUser();
        user.setWxOpenId(openId);
        user.setCreateBy(1);
        user.setStatus(SysUser.StatusEnum.ON.getValue());
        sysUserDao.save(user);

        return user;
    }
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void saveWxUserInfo(WxMaUserInfo userInfo) {
        SysUser user = UserUtils.getByWxOpenId(userInfo.getOpenId());
        user.setWxUnionId(userInfo.getUnionId());
        user.setNickName(userInfo.getNickName());
        user.setAvatarUrl(userInfo.getAvatarUrl());
        user.setCountry(userInfo.getCountry());
        user.setCity(userInfo.getCity());
        user.setGender(userInfo.getGender());
        user.setLanguage(userInfo.getLanguage());
        user.setUpdateBy(1);

        sysUserDao.update(user);
        UserUtils.clearCache(user);

        cardService.initTestCards(user.getId());
    }


    /**
     * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
     * @param plainPassword
     * @return
     */
    public static String encryptPassword(String plainPassword) {
        String plain = Encodes.unescapeHtml(plainPassword);
        byte[] salt = Digests.generateSalt(SALT_SIZE);
        byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, HASH_INTERATIONS);
        return Encodes.encodeHex(salt) + Encodes.encodeHex(hashPassword);

    }

    /**
     * 验证密码
     * @param plainPassword
     * @param password
     * @return
     */
    public static boolean validatePassword(String plainPassword, String password) {
        String plain = Encodes.unescapeHtml(plainPassword);
        byte[] salt = Encodes.decodeHex(password.substring(0,16));
        byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, HASH_INTERATIONS);
        return password.equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
    }

    public static void main(String[] args) {
        System.out.println(encryptPassword("thinkgem"));
    }



}
