import { View, Text, TextInput } from 'react-native';
import styles from '../app.styles';
import ButtonCTA from './ButtonCTA';

export default function Register({ uname, pw, uChange, pChange, ready }){
    return (
        <View style={styles.form}>
            <Text style={styles.brand}>TechnologyLearn</Text>
            <TextInput style={styles.input} placeholder="Username" onChangeText={uChange} value={uname} />
            <TextInput style={styles.input} placeholder="Password" secureTextEntry={true} onChangeText={pChange} value={pw} />
            <ButtonCTA title="Register" disabled={!ready} />
        </View>
    );
}