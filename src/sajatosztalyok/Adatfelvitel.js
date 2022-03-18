import React, { Component } from 'react';
import { StyleSheet,Text, TextInput, View,TouchableOpacity } from 'react-native-web';

const ipcim="localhost";

export default class Adatfelvitel extends Component {
  constructor(props) {
    super(props);
    this.state = {

        nev: '',
        kep:"",
        komment:""

    };
  }

felvitel=async ()=>{
    //alert("megnyomva a gomb")

    if (this.state.nev=="" || this.state.komment=="" || this.state.kep==""|| this.state.gyakid=="" )
    {
      alert("Add meg a nevet, képet és a kommmentet!")
      return
    }
    let bemenet={
      bevitel1:this.state.nev,
      bevitel2:this.state.kep,
      bevitel3:this.state.komment,
      bevitel4:this.state.gyakid
    }

    fetch('http://'+ipcim+':8080/adatfelvitel',{
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
      <View style = {{backgroundColor:"#42f598",}}>
        
        <Text style={{fontSize:30, textAlign:'center', marginTop:5, marginBottom:10}}>Írj véleményt vagy új gyakorlatot</Text>
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
          <Text style={{color:'black', fontSize:25}}>
                Kép:
            </Text>
          <TextInput
            placeholderTextColor="black"
            style={{backgroundColor:'white', marginBottom:15, borderRadius:10, height:30}}
            placeholder="Add meg a képet:"
            onChangeText={(kep) => this.setState({kep})}
            value={this.state.kep}
          />
  
          <Text style={{color:'black',fontSize:25}}>
                Gyakorlat leírás
            </Text>
          <TextInput
            placeholderTextColor="black"
            style={{backgroundColor:'white', marginBottom:15, borderRadius:10, height:30}}
            placeholder=" Add meg a leírást:"
            onChangeText={(komment) => this.setState({komment})}
            value={this.state.komment}
          />

<Text style={{color:'black',fontSize:25}}>
                Izomcsoport id
            </Text>
          <TextInput
            placeholderTextColor="black"
            style={{backgroundColor:'white', marginBottom:15, borderRadius:10, height:30}}
            placeholder=" Add meg a izomcsoport id-t"
            onChangeText={(gyakid) => this.setState({gyakid})}
            value={this.state.gyakid}
          />

          
           <TouchableOpacity
            onPress={async ()=>this.felvitel()}>
            <View style={styles.gomb}>
              <Text style={styles.gombSzoveg}>Küldés</Text>
            </View>
          </TouchableOpacity> 
  
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