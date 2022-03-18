import React, { Component } from 'react';
import { StyleSheet,Text, TextInput, View,TouchableOpacity,Picker } from 'react-native-web';
import FileUpload from "./upload";

const ipcim="localhost";

export default class Adatfelvitel extends Component {
  constructor(props) {
    super(props);
    this.state = {

        nev: '',
        kep:"",
        komment:"",
        gyakid:"",
        valaszt:0,
        dataSource_izom:[]
      
    };
  }

  componentDidMount(){
    return fetch('http://localhost:8080/izom')
      .then((response) => response.json())
      .then((responseJson) => {

        this.setState({
          isLoading: false,
          dataSource_izom: responseJson,
        }, function(){

        });

      })
      .catch((error) =>{
        console.error(error);
      });
  }

felvitel=async ()=>{
    alert("megnyomva a gomb")

  
    let bemenet={
      bevitel1:this.state.nev,
      bevitel2:this.state.kep,
      bevitel3:this.state.komment,
      bevitel4:this.state.valaszt
    }

    fetch('http://'+ipcim+':8080/adatfelvitel2',{
      method: "POST",
      body: JSON.stringify(bemenet),
      headers: {"Content-type": "application/json; charset=UTF-8"}
    }
       
    )
    .then((response) => response.text())
    .then((szoveg) => {

    alert(szoveg)
     this.setState({nev:""})
     this.setState({kep:""})
     this.setState({komment:""})
     this.setState({gyakid:""})

})
    
}



  render() {
    return (
      <View style = {{backgroundColor:"#42f598",borderRadius:20}}>
        
        <Text style={{fontSize:30, textAlign:'center', marginTop:5, marginBottom:10}}>Új gyakorlat hozzáadása</Text>
        <View style={{padding: 10 }}>
            <Text style={{color:'black', fontSize:25}}>
                Gyakorlat név:
            </Text>
          <TextInput
            placeholderTextColor="black"
            style={{backgroundColor:'white', marginBottom:15, borderRadius:10, height:30}}
            placeholder="Add meg a neved:"
            onChangeText={(nev) => this.setState({nev})}
            value={this.state.nev}
          />
         
  
          <Text style={{color:'black',fontSize:25}}>
                Gyakorlat leírás
            </Text>
          <TextInput
            placeholderTextColor="black"
            style={{backgroundColor:'white', marginBottom:15, borderRadius:10, height:150}}
            placeholder=" Add meg a leírást:"
            onChangeText={(komment) => this.setState({komment})}
            value={this.state.komment}
            multiline={true}
            numberOfLines={4}
          />
          
          

          
          
          <Picker
        selectedValue={this.state.valaszt}
        style={{ height: 50, width: 150 }}
        onValueChange={(itemValue, itemIndex) => this.setState({valaszt:itemValue})}
      >
        {this.state.dataSource_izom.map((item) => (
          <Picker.Item key={item.film_id} label={item.izom_nev} value={item.izom_id} />
        ))}
       
       
      </Picker>

           
          <FileUpload nev={this.state.nev}  kep={this.state.kep} komment={this.state.komment} valaszt={this.state.valaszt}></FileUpload>
          
          
          </View>
        
      </View>
    );
  }
}

const styles = StyleSheet.create({
    gombSzoveg:{
            textAlign:'center',
            color:'white',
            marginTop:'auto',
            marginBottom:'auto',
            fontSize:25
    },
    gomb:{
            height:45,
            backgroundColor:'blue',
            width:'15%',
            alignSelf:'center',
            borderRadius:20
    },
});