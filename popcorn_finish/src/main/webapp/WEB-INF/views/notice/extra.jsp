<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
<title>Home</title>
<style type="text/css">
.home {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: #222;
  font-family: 'Josefin Sans';
  background: linear-gradient(45deg, #fe3a7d, #ff7b0a);
  overflow: hidden;
  max-width: 100vw;
  max-height: 100vh;
}
.home:before {
  content: '';
  position: absolute;
  color: #999;
  font-size: 14px;
  z-index: 999;
  bottom: 10px;
  width: 100%;
  text-align: center;
}
.home * {
  transition: all 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
}
.home *:before, .home *:after {
  transition: all 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
  content: '';
  position: absolute;
  background: #fff;
}
.home input {
  opacity: 0;
  position: absolute;
  width: 100vw;
  height: 100vh;
  top: 0;
  left: 0;
  z-index: 9999;
  cursor: pointer;
}
.home input:checked ~ div {
  transition: all 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
  padding-right: 35px;
}
.home input:checked ~ div:before {
  -webkit-transform: scale(1);
          transform: scale(1);
  transition-delay: 0.2s;
}
.home input:checked ~ div h1:before {
  -webkit-transform: scaleY(1);
          transform: scaleY(1);
  transition: all 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
  transition-delay: 0.4s;
}
.home input:checked ~ div h1:after {
  box-shadow: 0 77px 0 1px #222, 0 72px 0 0px #fe3a7d;
  transition: all 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
  -webkit-transform: scaleY(1) rotate(5deg);
          transform: scaleY(1) rotate(5deg);
  transition-delay: 0.5s;
}
.home input:checked ~ div h1 *:before, .home input:checked ~ div h1 *:after {
  background: #fe3a7d;
}
.home input:checked ~ div h1 span {
  width: 50px;
}
.home input:checked ~ div h1 span:last-of-type {
  color: #fe3a7d;
  transition-delay: 0.25s;
}
.home input:checked ~ div h1 span:nth-of-type(2) {
  -webkit-transform: translateX(-2.5px) scaleY(1);
          transform: translateX(-2.5px) scaleY(1);
  width: 50px;
  margin: 0 5px;
}
.home input:checked ~ div h1 span:nth-of-type(2):before {
  box-shadow: 0 65px 0 0 #fe3a7d;
}
.home input:checked ~ div h1 span:nth-of-type(2):before, .home input:checked ~ div h1 span:nth-of-type(2):after {
  -webkit-transform: scaleX(1);
          transform: scaleX(1);
  transition-delay: 0.2s;
}
.home input:checked ~ div h1 span:nth-of-type(2):after {
  transition-delay: 0.4s;
}
.home input:checked ~ div h1 span:first-of-type {
  -webkit-transform: translateY(-2px) translateX(-2.5px);
          transform: translateY(-2px) translateX(-2.5px);
}
.home input:checked ~ div h1 span:first-of-type:before {
  -webkit-transform: translateX(0);
          transform: translateX(0);
}
.home input:checked ~ div h1 span:first-of-type b:before, .home input:checked ~ div h1 span:first-of-type b:after {
  transition-delay: 0.175s;
}
.home input:checked ~ div h1 span:first-of-type b:before {
  -webkit-transform: rotate(30deg) scaleY(1);
          transform: rotate(30deg) scaleY(1);
  transition-delay: 0.25s;
}
.home input:checked ~ div h1 span:first-of-type b:after {
  -webkit-transform: rotate(-30deg) scaleY(1);
          transform: rotate(-30deg) scaleY(1);
}
.home div {
  position: relative;
  display: inline-block;
  padding-right: 0px;
  min-width: 215px;
}
.home div:before {
  content: '';
  position: absolute;
  width: 500px;
  height: 500px;
  background: #222;
  border-radius: 100%;
  transition: all 500ms cubic-bezier(1, 0.885, 0.32, 1);
  -webkit-transform: scale(4);
          transform: scale(4);
  left: calc(50% - 250px);
  top: calc(50% - 250px);
}
.home div h1 {
  margin: 0px;
  color: #fff;
  font-weight: 100;
  font-size: 100px;
  position: relative;
}
.home div h1:after {
  width: 3px;
  height: 65px;
  top: 10px;
  background: linear-gradient(to bottom, #ff7b0a, #fe3a7d);
  right: -20px;
  display: inline-block;
  -webkit-transform: scaleY(0) rotate(5deg);
          transform: scaleY(0) rotate(5deg);
  box-shadow: 0 77px 0 -5px #222, 0 72px 0 -5px #fe3a7d;
  -webkit-transform-origin: bottom;
          transform-origin: bottom;
  transition: none;
}
.home div h1:before {
  width: 137.5px;
  height: 3px;
  background: linear-gradient(to right, #ff7b0a, #fe3a7d);
  bottom: 15px;
  right: 0px;
  -webkit-transform-origin: right;
          transform-origin: right;
  -webkit-transform: scaleX(0);
          transform: scaleX(0);
  transition: none;
}
.home div h1 span {
  display: inline-block;
  color: #000;
  position: relative;
  width: 0px;
}
.home div h1 span:last-of-type {
  width: auto;
  color: #fff;
}
.home div h1 span:first-of-type {
  -webkit-transform-origin: bottom;
          transform-origin: bottom;
  -webkit-transform: translateY(3px) translateX(-7.5px) scaleX(0);
          transform: translateY(3px) translateX(-7.5px) scaleX(0);
}
.home div h1 span:first-of-type:before {
  width: 3px;
  height: 30px;
  bottom: 32.5px;
  left: 31px;
  -webkit-transform: translateX(-25px);
          transform: translateX(-25px);
}
.home div h1 span:first-of-type b {
  position: relative;
  color: transparent;
}
.home div h1 span:first-of-type b:before, .home div h1 span:first-of-type b:after {
  height: 47.5px;
  top: 1px;
  width: 3px;
  -webkit-transform: rotate(0deg) scaleY(0);
          transform: rotate(0deg) scaleY(0);
  left: 31px;
  -webkit-transform-origin: 0px 100%;
          transform-origin: 0px 100%;
}
.home div h1 span:first-of-type b:after {
  -webkit-transform-origin: 100% 100%;
          transform-origin: 100% 100%;
}
.home div h1 span:nth-of-type(2) {
  -webkit-transform: translateX(-13px) scaleY(0);
          transform: translateX(-13px) scaleY(0);
}
.home div h1 span:nth-of-type(2):before, .home div h1 span:nth-of-type(2):after {
  width: 42px;
  height: 3px;
  top: 12px;
  left: 12px;
  box-shadow: 0 65px 0 0 #fff;
  transition: all 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275);
  -webkit-transform-origin: left;
          transform-origin: left;
  -webkit-transform: scaleX(0);
          transform: scaleX(0);
}
.home div h1 span:nth-of-type(2):after {
  box-shadow: none;
  top: 45px;
  width: 38px;
}
.home div h1 span:nth-of-type(2) b {
  position: relative;
  color: transparent;
}
.home div h1 span:nth-of-type(2) b:before {
  width: 3px;
  height: 68px;
  top: 5px;
  left: 12px;
}
</style>



</head>
<body>



<div class="home">
	<input type="checkbox" />
	<div>
		<h1>POP<span><b>C</b></span>
  			   <span><b>O</b></span>
  		 	   <span>RN</span>
  		</h1>
	</div>
</div>



</html>