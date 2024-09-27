FROM vllm/vllm-openai:v0.6.2


ENV VLLM_COMMIT=0455c46ed434d70f0a6219204e89ee04f1d01336
ENV VLLM_VERSION=0.6.1.post2
ENV DO_NOT_TRACK=1
COPY --chmod=775 endpoints-entrypoint.sh entrypoint.sh
RUN pip uninstall -y vllm && \
    pip install vllm==0.6.2

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
CMD [""]
