import React from 'react';
import {StyleSheet, FlatList, ActivityIndicator, Text, View, Image , TouchableOpacity } from 'react-native-web';

export default class FetchExample extends React.Component {

  constructor(props){
    super(props);
    this.state ={ isLoading: true}
  }

  szavazat=(szam)=>{
    //alert(szam)
    var bemenet={
      bevitel1:szam
    }

  fetch("http://localhost:8080/torles3", {
      method: "POST",
      body: JSON.stringify(bemenet),
      headers: {"Content-type": "application/json; charset=UTF-8"}
    }
  
  )
  .then(x => x.text())
  .then(y => {alert(y);this.lekerdezes();});

  }
lekerdezes=()=>{
  return fetch('http://localhost:8080/tema')
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
        <View style={{flex: 1, padding:20}}>
          <ActivityIndicator/>
        </View>
      )
    }

    return(
      <View style={{flex: 1, paddingTop:20}}>
        <FlatList
          data={this.state.dataSource}
          renderItem={({item}) => 

          <View style={{backgroundColor:"#B9F3EA", borderRadius:15, margin:10}}>

          <Text style={{color:"#dd00cc",fontSize:18,marginTop:5, marginLeft:10}}>
          {item.k_nev} </Text>
          <Text style={{color:"black",fontSize:20, marginLeft:10}}>
          {item.k_szoveg} </Text>
          <Text style={{color:"black",fontSize:12, marginRight:10, marginBottom:5, textAlign:'right'}}>
          {item.k_datum} </Text>
     
          
          

          <TouchableOpacity
        style={styles.kekgomb}
        onPress={async ()=>this.szavazat(item.k_id)}
      >
        <Text style={{color:"white",fontWeight:"bold",fontSize:15}}  >Törlés</Text>
      </TouchableOpacity>
          </View>
        
        }

        
          keyExtractor={({k_id}, index) => k_id}
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