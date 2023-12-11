# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 安装 Shellinabox
RUN apt-get update && \
    apt-get install -y shellinabox wget curl python3 python3-pip gnupg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置 root 用户的密码为 'root'
RUN echo 'root:root' | chpasswd

# 暴露 22 端口
EXPOSE 22

# 创建 CSS 文件
RUN echo "#vt100 #cursor.bright{background-color:white;color:black;}#vt100 #cursor.dim{background-color:black;opacity:0.2;-moz-opacity:0.2;filter:alpha(opacity=20);}#vt100 #scrollable{color:#ffffff;background-color:#000000;}#vt100 #scrollable.inverted{color:#000000;background-color:#ffffff;}#vt100 .ansiDef{color:#ffffff;}#vt100 .ansiDefR{color:#000000;}#vt100 .bgAnsiDef{background-color:#000000;}#vt100 .bgAnsiDefR{background-color:#ffffff;}#vt100 #scrollable.inverted .ansiDef{color:#000000;}#vt100 #scrollable.inverted .ansiDefR{color:#ffffff;}#vt100 #scrollable.inverted .bgAnsiDef{background-color:#ffffff;}#vt100 #scrollable.inverted .bgAnsiDefR{background-color:#000000;}" > /etc/shellinabox/black.css
# 启动 Shellinabox
CMD ["/usr/bin/shellinaboxd", "--user-css=Normal:+/etc/shellinabox/black.css", "-t", "-s", "/:LOGIN"]
