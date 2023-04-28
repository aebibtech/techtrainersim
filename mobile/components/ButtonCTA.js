import { Pressable, Text } from 'react-native';
import styles from '../app.styles';

export default function ButtonCTA({ onPress, title }){
    return(
        <Pressable onPress={onPress} style={styles.cta}>
            <Text style={styles.ctaText}>{title}</Text>
        </Pressable>
    );
}