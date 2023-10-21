<template lang="pug">
section.py-5
  .container.px-4.px-lg-5.mt-5
    .row.gx-4.gx-lg-5.row-cols-2.row-cols-md-3.row-cols-xl-4.justify-content-center
      .col.mb-5
        .card.h-100
          // Product image
          img.card-img-top(src='../assets/1mo.png' alt='...')
          // Product details
          .card-body.p-4
            .text-center
              // Product name
              h5.fw-bolder Secure for 1 month
              // Product price
              | 1 MNT
          // Product actions
          .card-footer.p-4.pt-0.border-top-0.bg-transparent
            .text-center
              b-button.btn-outline-dark.mt-auto(@click="mintNFT(1)") Buy This NFT
      .col.mb-5
        .card.h-100
          // Sale badge
          // Product image
          img.card-img-top(src='../assets/3mo.png' alt='...')
          // Product details
          .card-body.p-4
            .text-center
              // Product name
              h5.fw-bolder Secure for 3 month
              // Product reviews
              .d-flex.justify-content-center.small.text-warning.mb-2
                .bi-star-fill
                .bi-star-fill
                .bi-star-fill
                .bi-star-fill
                .bi-star-fill
              // Product price
              span.text-muted.text-decoration-line-through 3.00 MNT
              |                                     2.00 MNT
          // Product actions
          .card-footer.p-4.pt-0.border-top-0.bg-transparent
            .text-center
              b-button.btn-outline-dark.mt-auto(@click="mintNFT(3)") Buy This NFT
      .col.mb-5
        .card.h-100
          // Sale badge
          // Product image
          img.card-img-top(src='../assets/6mo.png' alt='...')
          // Product details
          .card-body.p-4
            .text-center
              // Product name
              h5.fw-bolder Secure for 6 month
              // Product price
              span.text-muted.text-decoration-line-through 6.00 MNT
              |                                     4.00 MNT
          // Product actions
          .card-footer.p-4.pt-0.border-top-0.bg-transparent
            .text-center
              b-button.btn-outline-dark.mt-auto(@click="mintNFT(6)") Buy This NFT
      .col.mb-5
        .card.h-100
          // Product image
          img.card-img-top(src='../assets/12mo.png' alt='...')
          // Product details
          .card-body.p-4
            .text-center
              // Product name
              h5.fw-bolder Secure for 12 month
              // Product reviews
              .d-flex.justify-content-center.small.text-warning.mb-2
                .bi-star-fill
                .bi-star-fill
                .bi-star-fill
                .bi-star-fill
                .bi-star-fill
                span.text-muted.text-decoration-line-through 12.00 MNT
              |                                     8.00 MNT
          // Product actions
          .card-footer.p-4.pt-0.border-top-0.bg-transparent
            .text-center
              b-button.btn-outline-dark.mt-auto(@click="mintNFT(12)") Buy This NFT
      .col.mb-5
        .card.h-100
          // Sale badge
          .badge.bg-dark.text-white.position-absolute(style='top: 0.5rem; right: 0.5rem') Sale
          // Product image
          img.card-img-top(src='../assets/24mo.png' alt='...')
          // Product details
          .card-body.p-4
            .text-center
              // Product name
              h5.fw-bolder Secure For 24 month
              // Product price
              span.text-muted.text-decoration-line-through 24.00 MNT
              |                                     15.00 MNT
          // Product actions
          .card-footer.p-4.pt-0.border-top-0.bg-transparent
            .text-center
              b-button.btn-outline-dark.mt-auto(@click="mintNFT(24)") Buy This NFT
    
</template>

<script>
// @ is an alias to /src
import Web3 from 'web3';
export default {
  name: 'HomeView',
  methods:{
  async  mintNFT(month) {
  try {
    await window.ethereum.enable();
    const web3 = new Web3(window.ethereum);
    const contractAddress = "0x1524fD7668Cd62694F03086D3dC9798a13f6A480";
    console.log(month)
    const contractABI = [{"inputs":[{"internalType":"uint8","name":"months","type":"uint8"}],"name":"mintToCaller","outputs":[],"stateMutability":"payable","type":"function"}]

    const nftContract = new web3.eth.Contract(contractABI,contractAddress);
	await window.ethereum.enable();

    const accounts = await web3.eth.getAccounts();
    const userAddress = accounts[0]; 
 
    const ethValue = web3.utils.toWei('1', 'ether');


    const transaction = await nftContract.methods.mintToCaller(month).send({ from: userAddress, value:ethValue });

    console.log('Transaction Hash: ' + transaction.transactionHash);

    await transaction.wait(1); 
	this.$router.push('balance') 
  } catch (error) {
    console.error('Transaction Error: ' + error.message);
  }
},




  }
}
</script>
