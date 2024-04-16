<script>
  import "../index.scss";
  import { backend } from "$lib/canisters";

  let status = "";
  let id = "";
  let name = "";
  let img = "";
  let price = "";
  let estate = null;
  let estateId = "";
  let deleteId = "";


  async function onSubmit(event) {
    await backend.add_estate(id, name, img, price).then((response) => {
      status = response;
    });
    return false;
  }

  async function onGetEstate(event) {
    try {
      const response = await backend.get_estate(id);
      estate = response;
    } catch (error) {
      console.error("estate alinirken hata", error);
    }
  }

async function onDeleteEstate() {
    await backend.delete_estate(id).then((response) => {
      status = response; 
    }); 
  }

</script>

<main>
  <img src="/logo2.svg" alt="DFINITY logo" />
  <br />
  <br />
  <form action="#" on:submit|preventDefault={onSubmit}>
    <label for="id">ID: &nbsp;</label>
    <input bind:value={id} id="id" alt="ID" type="text" />
    <br />
    <label for="name">Name: &nbsp;</label>
    <input bind:value={name} id="name" alt="Name" type="text" />
    <br />
    <label for="img">URL: &nbsp;</label>
    <input bind:value={img} id="img" alt="img" type="text" />
    <br />
    <label for="price">Price: &nbsp;</label>
    <input bind:value={price} id="price" alt="Price" type="text" />
    <br />
    <button type="submit">Add Estate</button>
  </form>
  <section id="status">
    <p>Create Estate Successful!</p>  
  </section>
  <br />
  <br />
  <form action="#" on:submit|preventDefault={onGetEstate}>
    <label for="estateId">Enter Estate ID: &nbsp;</label>
    <input bind:value={estateId} id="estateId" alt="Estate ID" type="text" />
    <button type="submit">Get Estate</button>
  </form>
  <br />
  <br />
  <form action="#" on:submit|preventDefault={onDeleteEstate}>
    <label for="deleteId">Enter Estate ID For Delete: &nbsp;</label>
    <input bind:value={deleteId} id="deleteId" alt="Delete ID" type="text" />
    <button type="submit">Delete Estate</button>
  </form>

  {#if estate}
  <section>
    <h2>Estate Information</h2>
    <p>ID: {estate?.id}</p> 
    <p>Name: {estate?.name}</p>
    <p>URL: {estate?.img}</p>
    <p>Price: {estate?.price}</p>
  </section>
{:else}
  <p>No estate found with ID: {estateId}</p>
{/if}

</main>
