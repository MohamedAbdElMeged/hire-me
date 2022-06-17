import React from "react";
import Footer from "../layouts/Footer";
import NavBar from "../layouts/NavBar";
import Slider from "./Slider";
import Test from "./Test";
class Home extends React.Component{
render(){
   return (
    <div>
        <NavBar></NavBar>
        <Slider></Slider>
        {/* <Test></Test> */}
        <Footer></Footer>
    </div>
   )
}

}

export default  Home;