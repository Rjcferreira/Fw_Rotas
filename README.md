🚚 Sistema de Rotas – OX Framework

Sistema de rotas totalmente integrado ao OX Framework, criado para oferecer missões de entrega, coleta e transporte de forma simples, leve e plug & play para servidores FiveM. Ideal para trabalhos de caminhoneiro, entregador, motorista, entregas urbanas ou rotas personalizadas. Fácil de configurar e totalmente otimizado.

✨ Funcionalidades

Integração nativa com ox_lib, ox_target e ox_inventory

Rotas totalmente configuráveis via config.lua

Suporte a múltiplos trajetos, checkpoints e destinos

Sistema de pagamento configurável por rota

Animações opcionais durante entrega/coleta

Permissões para jobs específicos ou rotas liberadas para todos

Plug & play — basta instalar e rodar

Performance leve (0.00ms idle)

📁 Estrutura do Recurso

sistema-rotas/
│── client.lua
│── server.lua
│── config.lua
│── fxmanifest.lua

⚙️ Instalação

Baixe ou clone este repositório:
git clone https://github.com/seu-usuario/sistema-rotas

Coloque a pasta na sua pasta de recursos do FiveM:
resources/[ox]/sistema-rotas

Adicione ao seu server.cfg:
ensure sistema-rotas

Configure suas rotas no arquivo config.lua conforme a necessidade do seu servidor.

🛠️ Configuração (Exemplo)

Config.Rotas = {
{
nome = "Entrega de Caixas",
job = "entregador",
inicio = vec3(123.4, -321.7, 30.1),
destinos = {
vec3(215.3, -820.5, 30.0),
vec3(-142.4, -589.9, 32.4),
vec3(-425.1, 276.5, 83.2)
},
item = "caixa",
quantidade = 1,
pagamento = 150,
anim = true
},
{
nome = "Transporte de Peças",
job = false,
inicio = vec3(841.2, -1200.4, 25.4),
destinos = {
vec3(1002.5, -300.5, 70.2),
vec3(452.1, -648.3, 28.5)
},
item = "peca",
quantidade = 2,
pagamento = 250,
anim = false
}
}

🎮 Como Funciona

O jogador vai até o ponto inicial da rota.

O ox_target exibe a opção de iniciar a rota.

O jogador recebe o item (se configurado) e o primeiro destino aparece.

Ao chegar no destino, ele entrega, coleta ou realiza ação configurada.

O sistema avança automaticamente para o próximo ponto.

Ao concluir a rota, o jogador recebe o pagamento configurado.

🤝 Contribuições

Contribuições são sempre bem-vindas! Basta fazer um fork, criar uma branch e enviar um Pull Request com melhorias ou correções.

📄 Licença

Este projeto utiliza a licença MIT, permitindo uso, modificação e redistribuição livre.

🔗 Links Úteis

Discord: https://discord.gg/6nHCTndkfq

Loja (Tebex): https://flowstore.tebex.io/

GitHub FlowStore: https://github.com/Rjcferreira

YouTube: https://youtube.com/@flow_store
