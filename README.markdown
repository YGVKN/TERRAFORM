# TerraForm certs validate
## AWS ACM Validation & Alarm

[![TerraForm | AWS ACM](https://miro.medium.com/max/640/1*yC8jKlY1uaUyntCxVcvHyw.png)](https://aws.amazon.com/ru/certificate-manager/)


- shell run >
- alias terra="terraform"
- export TF_LOG_DEBUG=1
- terra init
- terra fmt && terra validate
- terra plan    -refresh
- terra apply   -refresh -auto-approve
- terra show && terra state list
- terra destroy -auto-approve
- [YGVKN]()
- ✨Magic ✨
