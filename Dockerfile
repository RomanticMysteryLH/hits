# 使用官方 Java 17 镜像
FROM eclipse-temurin:17-jdk

# 设置工作目录
WORKDIR /app

# 拷贝项目代码到容器中
COPY . .

# 授权 Maven Wrapper 执行权限并构建项目
RUN chmod +x ./mvnw && ./mvnw clean package -P production

# 设置运行命令，使用构建后的 JAR 包
CMD ["java", "-jar", "target/hits-0.0.1-SNAPSHOT.jar"]
