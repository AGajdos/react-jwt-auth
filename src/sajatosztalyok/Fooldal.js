import React from 'react';
import {StyleSheet, FlatList, ActivityIndicator, Text, View, Image , TouchableOpacity } from 'react-native-web';
import Iframe from 'react-iframe';

export default class Fooldal extends React.Component {

  constructor(props){
    super(props);
    this.state ={
       isLoading: true,
       dataSource:[]
    }
  }
  
  componentDidMount(){
    return fetch('http://localhost:8080/video')
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

  render(){
    return(
      
      <View style={{ }}>
        <FlatList
          data={this.state.dataSource}
          renderItem={({item}) => 
          <View style={{marginBottom:30}}>
            <Text style={{fontSize:40,textAlign:"center",marginTop:15,marginBottom:5,fontWeight:"bold" }}   >{item.video_nev} </Text>
          <Iframe url={item.video_link}
          width="auto"
          height="500px"
          textalign="center"
          id="myId"
          className="myClassname"
          display="initial"
          position="relative"/>
  
         </View>
        }
        />
      </View>
    );
  }
}
