import { StyleSheet } from "react-native";

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#fff',
        alignItems: 'center',
        justifyContent: 'center',
    },
    form: {
        flexWrap: 'wrap',
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'center',
        padding: 24
    },
    brand: {
        fontFamily: "monospace",
        fontSize: 36,
        marginBottom: 12
    },
    input: {
        flexGrow: 1,
        fontSize: 18,
        borderWidth: 1,
        borderColor: "gray",
        width: "100%",
        borderRadius: 10,
        padding: 10,
        marginBottom: 16,
    },
    cta: {
        paddingVertical: 12,
        paddingHorizontal: 48,
        backgroundColor: 'green',
        marginTop: 24,
        borderRadius: 12
    },
    ctaText: {
        color: 'white',
        fontSize: 16
    }
});

export default styles;