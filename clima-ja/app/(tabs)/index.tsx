import React, { useState, useEffect } from 'react';
import { FontAwesome5 } from '@expo/vector-icons';
import { View, Text, TextInput, TouchableOpacity, Image, StyleSheet, ImageBackground } from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';

const apiKey = "5bcc12ca410fab836c7341ea82bc90dc";
const apiCountryURL = "https://flagsapi.com/";
const apiUnsplash = "https://api.unsplash.com/search/photos?query=";

interface WeatherData {
  name: string;
  main: {
    temp: number;
    humidity: number;
  };
  weather: { description: string; icon: string }[];
  sys: { country: string };
  wind: { speed: number };
}

export default function WeatherApp() {
  const [city, setCity] = useState('');
  const [weatherData, setWeatherData] = useState<WeatherData | null>(null);
  const [backgroundImage, setBackgroundImage] = useState<string>('https://via.placeholder.com/1920x1080');
  const [error, setError] = useState<boolean>(false);
  const [cityTitle, setCityTitle] = useState<string>(''); // Estado separado para o título da cidade

  useEffect(() => {
    console.log("🔄 Atualizando Background:", backgroundImage);
  }, [backgroundImage]);

  const getBackgroundImage = async (city: string): Promise<string> => {
    try {
      const res = await fetch(`${apiUnsplash}${city}&client_id=kjNVFcLc2lVPcc7o4chDsgEvELxcd_J96XVSOgTc79E`);
      const data = await res.json();
  
      if (data.results.length > 0) {
        const randomIndex = Math.floor(Math.random() * data.results.length);
        return data.results[randomIndex].urls.regular;
      } else {
        return 'https://via.placeholder.com/1920x1080';
      }
    } catch (error) {
      return 'https://via.placeholder.com/1920x1080';
    }
  };

  const getWeatherData = async () => {
    if (!city) return;

    const apiWeatherURL = `https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=${apiKey}&lang=pt_br`;

    try {
      setError(false);
      const res = await fetch(apiWeatherURL);
      const data = await res.json();
      
      if (data.cod !== 200) {
        setWeatherData(null);  
        setError(true);
        return;
      }
      
      setWeatherData(data);
      setCityTitle(city); // Atualiza o título da cidade somente após a pesquisa bem-sucedida

      const backgroundImageURL = await getBackgroundImage(city);
      setBackgroundImage(backgroundImageURL);
  
    } catch (error) {
      console.error("Erro ao buscar clima:", error);
      setWeatherData(null);  
      setError(true);
    }
  };

  return (
    <ImageBackground
        key={backgroundImage}
        source={{ uri: backgroundImage }}
        style={styles.backgroundImage}
        resizeMode="cover"
    >
      {/* LinearGradient só é mostrado quando a imagem de fundo não está disponível */}
      {!backgroundImage || backgroundImage === 'https://via.placeholder.com/1920x1080' ? (
        <LinearGradient
          colors={['rgba(89, 76, 238, 0.7)', 'rgba(141, 208, 245, 0.7)']}
          style={styles.gradientContainer}
        >
          <View style={styles.form}>
            <Text style={styles.title}>Confira o Clima de uma cidade:</Text>
            <View style={styles.inputContainer}>
              <TextInput
                style={styles.input}
                placeholder="Digite o nome da cidade"
                value={city}
                onChangeText={setCity}
              />
              <TouchableOpacity onPress={getWeatherData} style={styles.button}>
                <FontAwesome5 name="search" size={20} color="#fff" />
              </TouchableOpacity>
            </View>
          </View>
        </LinearGradient>
      ) : (
        <View style={styles.form}>
          <Text style={styles.title}>Confira o Clima de uma cidade:</Text>
          <View style={styles.inputContainer}>
            <TextInput
              style={styles.input}
              placeholder="Digite o nome da cidade"
              value={city}
              onChangeText={setCity}
            />
            <TouchableOpacity onPress={getWeatherData} style={styles.button}>
              <FontAwesome5 name="search" size={20} color="#fff" />
            </TouchableOpacity>
          </View>
        </View>
      )}

      {weatherData && (
        <View style={styles.weatherContainer}>
          <Text style={styles.cityName}>
            <FontAwesome5 name="map-marker-alt" size={20} color="#fff" /> 
            <Text style={styles.cityTitle}>{cityTitle}</Text> {/* Título da cidade fixo após pesquisa */}
            <Image
              source={{ uri: `${apiCountryURL}${weatherData.sys.country}/flat/64.png` }}
              style={styles.countryFlag}
            />
          </Text>
          <Text style={styles.temperature}>{parseInt(weatherData.main.temp.toString())}°C</Text>
          <View style={styles.descriptionContainer}>
            <Text style={styles.description}>{weatherData.weather[0].description}</Text>
            <Image
              source={{ uri: `http://openweathermap.org/img/wn/${weatherData.weather[0].icon}.png` }}
              style={styles.weatherIcon}
            />
          </View>
          <View style={styles.detailsContainer}>
            <Text style={styles.detailItem}>
              <FontAwesome5 name="tint" size={20} color="#fff" />  
              <Text> Humidade: {weatherData.main.humidity}%</Text>
            </Text>
            <Text style={styles.detailItem}>
              <FontAwesome5 name="wind" size={20} color="#fff" />  
              <Text> Vento: {weatherData.wind.speed} m/s</Text>
            </Text>
          </View>
        </View>
      )}

      {error && !weatherData && (
        <Text style={styles.errorText}>Cidade não encontrada ou erro ao buscar dados.</Text>
      )}
    </ImageBackground>
  );
}

const styles = StyleSheet.create({
  backgroundImage: {
    flex: 1,
    width: '100%',
    height: '100%',
    justifyContent: 'center',
    alignItems: 'center',
    padding: 35,
  },
  gradientContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
    width: '100%',
  },
  form: {
    backgroundColor: '#5c54ed',
    padding: 20,
    borderRadius: 10,
    marginBottom: 20,
    width: '100%',
  },
  title: {
    fontSize: 18,
    color: '#fff',
    marginBottom: 10,
  },
  cityTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#fff',
  },
  inputContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 20,
  },
  input: {
    flex: 1,
    backgroundColor: '#fff',
    padding: 10,
    borderRadius: 4,
    marginRight: 10,
  },
  button: {
    backgroundColor: '#8dd0f5',
    padding: 10,
    borderRadius: 4,
  },
  weatherContainer: {
    backgroundColor: '#5c54ed',
    padding: 20,
    borderRadius: 10,
    marginTop: 20,
    width: '100%',
    alignItems: 'center',
  },
  cityName: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#fff',
  },
  temperature: {
    fontSize: 30,
    fontWeight: 'bold',
    color: '#fff',
  },
  descriptionContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    marginVertical: 10,
  },
  description: {
    fontSize: 16,
    color: '#fff',
    textTransform: 'capitalize',
  },
  weatherIcon: {
    width: 50,
    height: 50,
  },
  countryFlag: {
    width: 40,
    height: 25,
  },
  detailsContainer: {
    flexDirection: 'row',
    justifyContent: 'center',
    marginTop: 20,
  },
  detailItem: {
    fontSize: 14,
    color: '#fff',
    marginHorizontal: 10,
  },
  errorText: {
    fontSize: 16,
    color: 'red',
    marginTop: 10,
  },
});
