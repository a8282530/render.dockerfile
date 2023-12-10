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

# 安装zerotier
# RUN apt-get update && apt-get install -y zerotier-one=1.8.6
# COPY ext/installfiles/linux/zerotier-containerized/main.sh /var/lib/zerotier-one/main.sh

# EXPOSE 9993/udp

# RUN mkdir -p /var/lib/zerotier-one
# COPY --from=builder /usr/sbin/zerotier-cli /usr/sbin/zerotier-cli
# COPY --from=builder /usr/sbin/zerotier-idtool /usr/sbin/zerotier-idtool
# COPY --from=builder /usr/sbin/zerotier-one /usr/sbin/zerotier-one
# COPY --from=builder /var/lib/zerotier-one/main.sh /main.sh

# RUN chmod 0755 /main.sh
# ENTRYPOINT ["/main.sh"]
# CMD ["zerotier-one"]

# RUN systemctl start zerotier-one && \
#     systemctl enable zerotier-one && \
#     zerotier-cli join 3efa5cb78ac5bfdb

# 启动 Shellinabox
CMD ["/usr/bin/shellinaboxd", "--user-css", "/etc/shellinabox/options-enabled/01_Monochrome.css", "-t", "-s", "/root:LOGIN"]
