# Use a versão mais recente do Node.js 20.x
FROM node:20

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y openssl

# Instalar Bun
RUN curl -fsSL https://bun.sh/install | bash

# Adicionar Bun ao PATH
ENV PATH="/root/.bun/bin:$PATH"

# Criar diretório de trabalho
WORKDIR /app

# Copiar package.json e package-lock.json
COPY package*.json ./

# Instalar dependências do Node.js
RUN npm install

# Copiar o restante da aplicação
COPY . .

CMD ["sh", "-c", "bun install"]
# Comando de inicialização
CMD ["sh", "-c", "bun generate-prisma && bun dev"]
