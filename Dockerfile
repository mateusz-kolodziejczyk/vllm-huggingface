FROM vllm/vllm-openai:v0.6.1


ENV VLLM_COMMIT=2467b642dd9bde32a334fe5967efd78a53aa49da
ENV VLLM_VERSION=0.6.1.post3.dev113+g2467b642.d20240924
ENV DO_NOT_TRACK=1

COPY --chmod=775 endpoints-entrypoint.sh entrypoint.sh

RUN pip uninstall -y vllm && \
    pip install https://vllm-wheels.s3.us-west-2.amazonaws.com/${VLLM_COMMIT}/vllm-${VLLM_VERSION}-cp38-abi3-manylinux1_x86_64.whl

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
CMD [""]
