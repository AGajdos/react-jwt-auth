
import axios from 'axios';
import React,{useState} from 'react'

function FileUpload(props) {

    const [file, setFile] = useState();
    const [fileName, setFileName] = useState("");

    const saveFile = (e) => {
        setFile(e.target.files[0]);
        setFileName(e.target.files[0].name);
    };

    const uploadFile = async (e) => {
        const formData = new FormData();
        formData.append("file", file);
        formData.append("fileName", fileName);
        if (props.nev=="" || props.komment==""  )
        {
        alert("Add meg a nevet, izomcsoportot és a kommmentet!")
        return
        }
        if (!file)
        {alert("Fajl nincs feltöltve!");
        return;}
        try {
            const res = await axios.post(
                "http://localhost:8080/upload",
                formData
            );
            console.log(res);
            //-------------------------------------------------------------
            
            alert(props);
            let bemenet={
                bevitel1:props.nev,
                bevitel2:fileName,
                bevitel3:props.komment,
                bevitel4:props.valaszt
                
              }
          
              fetch('http://localhost:8080/adatfelvitel2',{
                method: "POST",
                body: JSON.stringify(bemenet),
                headers: {"Content-type": "application/json; charset=UTF-8"}
              }
                 
              )
              .then((response) => response.text())
              .then((szoveg) => {
          
              alert(szoveg)
               
          
          })
            //-------------------------------------------------------------
        
           
            
        } catch (ex) {
            console.log(ex);
        }
    };

        return (
            <div className="App">
                <input type="file" onChange={saveFile} />
                <button style={{alignItems:"center",borderRadius:5,backgroundColor:"blue",color:"white",padding:10,}} onClick={uploadFile}>Feltöltés</button>
                
            </div>
        );
}

export default FileUpload;