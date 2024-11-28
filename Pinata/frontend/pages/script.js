

const JWT_TOKEN = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySW5mb3JtYXRpb24iOnsiaWQiOiJjMTg5ZWQ3MC1jYjczLTRhMjItYmIxNS01NDlkNDMyZDBkMWEiLCJlbWFpbCI6ImRpbWtheWlscml0QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJwaW5fcG9saWN5Ijp7InJlZ2lvbnMiOlt7ImRlc2lyZWRSZXBsaWNhdGlvbkNvdW50IjoxLCJpZCI6IkZSQTEifSx7ImRlc2lyZWRSZXBsaWNhdGlvbkNvdW50IjoxLCJpZCI6Ik5ZQzEifV0sInZlcnNpb24iOjF9LCJtZmFfZW5hYmxlZCI6ZmFsc2UsInN0YXR1cyI6IkFDVElWRSJ9LCJhdXRoZW50aWNhdGlvblR5cGUiOiJzY29wZWRLZXkiLCJzY29wZWRLZXlLZXkiOiIyNzliMThiYmY1YzY2NTI0NGYzNSIsInNjb3BlZEtleVNlY3JldCI6IjQyMTM5NDI5YzU1ZTQxMzBjOGZkYjQ1NTExZDZjOGM0MmNjOGU2MTY1NWI1NDA1OTEyYzk3NjUxNmNhOTkwMTIiLCJleHAiOjE3NjI2NTcwOTZ9.PvmZyzkjec8u34z1rFKqPoZJhKL7Wk66x5-BUvC7Pj8";
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
    console.log(response.data.data.cid);

  } catch (error) {
    console.log(error);
  }



};

window.fileUpload = fileUpload;
