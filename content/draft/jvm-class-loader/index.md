---
title: Java虚拟机类加载机制
date: 2019:05:21
---

- **加载 Loading**

- **验证 Verification**

- **准备 Preparation**

- **解析 Resolution**

- **初始化 Initialization**
  - 在 [The Java Virtual Machine Specification Java SE 8 Edition](https://docs.oracle.com/javase/specs/jvms/se8/jvms8.pdf) 中提到，一个类或接口可能被初始化的情况有以下6种
    - 在执行Java虚拟机指令`new`、`getstatic`、`putstatic`、`invokestatic`时, 如果尚未初始化所引用的类，则初始化该类。
    - 第一次调用`java.lang.invoke.MethodHandle`实例的解析结果是REF_getStatic, REF_putStatic, REF_invokeStatic, or REF_newInvokeSpecial时，这个方法句柄对应的类还没有进行初始化，则初始化该类。
    - 反射方法的调用，例如`java.lang.reflect`中的类
    - 初始化一个类时，会先触发其父类的初始化方法
    - 如果c是一个非abstract或非static的接口，则在实现这个接口的时候初始化实现类
    - 一个类被指定为Java虚拟机启动时的初始类
- **使用 Using**

- **卸载 Unloading**

