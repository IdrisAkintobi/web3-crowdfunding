# Load environment variables from .env
include .env
export $(shell sed 's/=.*//' .env)

# Formatting and Testing prerequisite
.PHONY: check
check:
	forge fmt
	forge test

# Deployment targets
AreaCalculator: check
	forge script script/AreaCalculator.s.sol --rpc-url lisk-sepolia --broadcast --verify

IDrisNFT: check
	forge script script/IDrisNFT.s.sol --rpc-url sepolia --broadcast --verify

Crowdfunding: check
	forge script script/Crowdfunding.s.sol --rpc-url sepolia--broadcast --verify

IDrisSVGOncChainNFT: check
	forge script script/IDrisSVGOncChainNFT.s.sol --rpc-url sepolia --broadcast --verify

IDrisSVGOncChainNFT-local: check
	forge script script/IDrisSVGOncChainNFT.s.sol --rpc-url localhost --broadcast
	# Ensure the DO_NOT_KEY is updated in the env file.
