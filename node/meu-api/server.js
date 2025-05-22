const express = require('express');
const app = express();

app.use(express.json()); // Para aceitar JSON no POST

// Rota GET
app.get('/oi', (req, res) => {
  res.send('Oi (GET kk)');
});

// Rota POST
app.post('/oi', (req, res) => {
  res.send('Oi (POST kk)');
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
