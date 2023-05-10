//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.4.11;

contract KookminStore {
	uint8 numTypes;		// 굿즈 타입 개수 
	mapping(uint8 => uint) goods;	// (굿즈 타입, 남은 수량)

	address owner;	// 스토어(컨트랙트) 주인
	bool ended;		// 스토어 종료 여부

	modifier onlyOwner () {
		require(msg.sender == owner);
		_;
	}

	// 생성자 
	constructor () {
		owner = msg.sender;
		ended = false;

		numTypes = 3;
		goods[1] = 3;		// type1 : 3개
		goods[2] = 2;		// type2 : 2개
		goods[3] = 1;		// type3 : 1개
	}

	// 굿즈 구매
	function buy(uint8 goodsType) payable public {
		// 스토어 종료됐으면 중단
		require(!ended);

		// 해당 상품 품절됐으면 중단 
		if (goods[goodsType] == 0)
			revert();

		goods[goodsType] -= 1;		// 해당 상품 수량 1 감소 
	}

	// 남은 수량 확인
	function getNumStock(uint8 goodsType) view public returns(uint) {
		return goods[goodsType];
	}

	// 컨트랙트에 모인 수익 확인 - 테스트용 
	function getProfits() view public onlyOwner returns(uint) {
		return address(this).balance;
	}

	// 품절 체크 - 모두 팔렸으면, 스토어 주인에게 이더 송금
	function checkSoldout() payable public onlyOwner {
		// 스토어 종료됐으면 중단
		require(!ended);

		// 재고가 있으면 중단 
		for (uint8 i=1; i<=numTypes; i++) {
			if (goods[i] != 0)		
				revert();
		}

		// 품절이면, 스토어 주인에게 이더 송금, 스토어 종료 
		if(!payable(owner).send(address(this).balance))
			revert();
		ended = true;
	}

	// 스토어 종료 확인
	function isEnded() view public returns(bool) {
		return ended;
	}

	// 컨트랙트를 소멸시키기 위한 함수
	function kill() public onlyOwner {
		selfdestruct(payable(owner));
	}
}
