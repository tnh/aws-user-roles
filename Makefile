.PHONY: validate deploy
all: validate deploy

export BRANCH_NAME ?= local
export ACCOUNT ?= my-account
export STACK_NAME ?= aws-roles-$(BRANCH_NAME)
export ROLE_ARN ?= arn:aws:iam::12345678:role/some-deploy-role

validate:
	aws cloudformation validate-template --region ap-southeast-2 --template-body file://cloudformation/deploy.yaml

deploy:
	scripts/create_or_update_stack.sh $(STACK_NAME) cloudformation/deploy.yaml cloudformation/params.json
