package org.nocoder.service;

import org.nocoder.model.User;

public abstract interface UserService
{
  public abstract User queryUserByNameAndPwd(String paramString1, String paramString2);
}
