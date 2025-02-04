import React from 'react';
import {StyleSheet, FlatList, ActivityIndicator, Text, View, Image , TouchableOpacity } from 'react-native-web';

export default class FetchExample extends React.Component {

  constructor(props){
    super(props);
    this.state ={ isLoading: true}
  }

  szavazat=(szam)=>{
    var bemenet={
      bevitel1:szam
    }

  fetch("http://localhost:8080/torles", {
      method: "POST",
      body: JSON.stringify(bemenet),
      headers: {"Content-type": "application/json; charset=UTF-8"}
    }
  
  )
  .then(x => x.text())
  .then(y => {alert(y);this.lekerdezes();});

  }
lekerdezes=()=>{
  return fetch('http://localhost:8080/gyakorlatok')
      .then((response) => response.json())
      .then((responseJson) => {

        this.setState({
          isLoading: false,
          dataSource: responseJson,
        }, function(){

        });

      })
      .catch((error) =>{
        console.error(error);
        
      });
  }
  componentDidMount(){
    this.lekerdezes()
    
}

  render(){
    if(this.state.isLoading){
      return(
        <View style={{flex: 3,flexDirection: "row", padding: 20}}>
          <ActivityIndicator size="large" color="#00ff00" />
        </View>
      )
    }
    return(
      <View  style={{display:"flex",flexDirection:"row",flex:3,paddingTop:20,}}>
        
        <FlatList
          data={this.state.dataSource}
          renderItem={({item}) => 

          <View >
          <Text style={{color:"brown",fontSize:20,textAlign:"center",marginTop:15,marginBottom:5}}   >{item.gyakorlat_nev} </Text>
          <Image  source={{uri: 'http://localhost:8080/'+item.gyakorlat_kep}} style={{width:300,height:300,marginLeft:"auto",marginRight:"auto"}} />  

          <TouchableOpacity
        style={styles.kekgomb}
        onPress={async ()=>this.szavazat(item.id_gyakorlatok)}
      >
        <Text style={{color:"white",fontWeight:"bold",fontSize:15}}  >Törlés</Text>
      </TouchableOpacity>
          </View>
        
        }
          keyExtractor={({id_gyakorlatok}, index) => id_gyakorlatok}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  
  kekgomb: {
    alignItems: "center",
    backgroundColor: "blue",
    padding: 10,
    width:300,
    marginLeft:"auto",
    marginRight:"auto",
  }
});