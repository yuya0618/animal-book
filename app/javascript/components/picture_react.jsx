import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

var createObjectURL = (window.URL || window.webkitURL).createObjectURL || window.createObjectURL;

var Post = React.createClass({
  getInitialState(){
    return{
      image_src:""
    };
  },
  handleChangeFile: function(e){
    // ①イベントからfileの配列を受け取る
    var files = e.target.files;
    // ②createObjectURLで、file[0]を読み込む
    var image_url = files.length===0 ? "": createObjectURL(files[0]);
    // ③setStateする！
    this.setState({image_src: image_url});
  },
  render(){
    return(
      <div>
        <input type="file" ref="file" onChange={this.handleChangeFile}/>
        <img src={this.state.image_src} />
        <button onClick={this.ClickPostBtn}type="button">投稿する</button>
      </div>
    );
  }
});