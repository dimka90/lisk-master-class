

const JWT_TOKEN = "INPUT TOKEN HERE";
export async function fileUpload(){

const config = "";

const fileObject = document.getElementById("image");
console.log(fileObject.files[0]);

  try {
    const formData = new FormData();
    const file = fileObject.files[0];

    formData.append("file", file);
    console.log("Trying to upload file")

    const request = await fetch("https://uploads.pinata.cloud/v3/files", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${JWT_TOKEN}`,
      },
      body: formData,
    });
    const response = await request.json();
    console.log(response);
    const imageCid = response.data.cid;
    const ImageName = response.data.cid;

    if (window.ethereum) {
      try {
        const provider = new ethers.BrowserProvider(window.ethereum);
        const signer = await provider.getSigner();
      }
      catch(error){
        console.log("error");
      }
  }

   } catch (error) {
    console.log(error);
  }



};

window.fileUpload = fileUpload;
