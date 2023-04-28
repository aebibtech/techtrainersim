// Example of Splash, Login and Sign Up in React Native
// https://aboutreact.com/react-native-login-and-signup/
import 'react-native-gesture-handler';

// Import React and Component
import React from 'react';

// Import Navigators from React Navigation
import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';

// Import Screens
import SplashScreen from './Screen/SplashScreen';
import LoginScreen from './Screen/LoginScreen';
import RegisterScreen from './Screen/RegisterScreen';
import DrawerNavigationRoutes from './Screen/DrawerNavigationRoutes';

const Stack = createStackNavigator();

const Auth = () => {
  // Stack Navigator for Login and Sign up Screen
  return (
    <Stack.Navigator initialRouteName="LoginScreen">
      <Stack.Screen
        name="LoginScreen"
        component={LoginScreen}
        options={{headerShown: false}}
      />
      <Stack.Screen
        name="RegisterScreen"
        component={RegisterScreen}
        options={{
          title: 'Register', //Set Header Title
          headerStyle: {
            backgroundColor: '#307ecc', //Set Header color
          },
          headerTintColor: '#fff', //Set Header text color
          headerTitleStyle: {
            fontWeight: 'bold', //Set Header text style
          },
        }}
      />
    </Stack.Navigator>
  );
};

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="SplashScreen">
        {/* SplashScreen which will come once for 5 Seconds */}
        <Stack.Screen
          name="SplashScreen"
          component={SplashScreen}
          // Hiding header for Splash Screen
          options={{headerShown: false}}
        />
        {/* Auth Navigator: Include Login and Signup */}
        <Stack.Screen
          name="Auth"
          component={Auth}
          options={{headerShown: false}}
        />
        {/* Navigation Drawer as a landing page */}
        <Stack.Screen
          name="DrawerNavigationRoutes"
          component={DrawerNavigationRoutes}
          // Hiding header for Navigation Drawer
          options={{headerShown: false}}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;

// import { useState } from 'react';
// import { View } from 'react-native';
// import Login from './components/Login';
// import Register from './components/Register';
// import styles from './app.styles';
// import { NavigationContainer } from '@react-navigation/native';
// import { createStackNavigator } from '@react-navigation/stack';

// const Stack = createStackNavigator();

// const Auth = () => {
//     // Stack Navigator for Login and Sign up Screen
//     return (
//         <Stack.Navigator initialRouteName="Login">
//             <Stack.Screen
//             name="Login"
//             component={Login}
//             options={{headerShown: false}}
//             />
//             <Stack.Screen
//             name="Register"
//             component={Register}
//             options={{
//                 title: 'Register', //Set Header Title
//                 headerStyle: {
//                 backgroundColor: '#307ecc', //Set Header color
//                 },
//                 headerTintColor: '#fff', //Set Header text color
//                 headerTitleStyle: {
//                 fontWeight: 'bold', //Set Header text style
//                 },
//             }}
//             />
//         </Stack.Navigator>
//     );
// };



// export default function App() {
//     const [ username, setUserName ] = useState("");
//     const [ password, setPassword ] = useState("");
    
//     function handleUNChange(uname){
//         setUserName(uname);
//     }

//     function handlePWChange(pw){
//         setPassword(pw);
//     }

//     return (
//         <NavigationContainer>
//             <View style={styles.container}>
//                 <Login ready={username != "" && password != ""} uChange={handleUNChange} pChange={handlePWChange} uname={username} pw={password} />
//             </View>
//         </NavigationContainer>
//     );
// }
