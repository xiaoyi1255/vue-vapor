#!/bin/bash

echo "🚀 开始启动Vue项目工作空间..."

# 检查是否安装了pnpm
if ! command -v pnpm &> /dev/null; then
    echo "❌ pnpm未安装，请先安装pnpm: npm install -g pnpm"
    exit 1
fi

echo "📦 安装所有项目依赖..."
pnpm install --recursive

echo "🔧 检查项目配置..."

# 检查vite-vue3项目
if [ ! -d "vite-vue3/node_modules" ]; then
    echo "📦 安装vite-vue3依赖..."
    cd vite-vue3 && pnpm install && cd ..
fi

# 检查vue-vapor项目
if [ ! -d "vue-vapor/node_modules" ]; then
    echo "📦 安装vue-vapor依赖..."
    cd vue-vapor && pnpm install && cd ..
fi

echo "✅ 依赖安装完成！"
echo ""
echo "🎯 可用的启动命令："
echo "  pnpm dev              - 同时启动两个项目"
echo "  pnpm dev:vite-vue3    - 只启动vite-vue3项目"
echo "  pnpm dev:vue-vapor    - 只启动vue-vapor项目"
echo ""
echo "🌐 项目访问地址："
echo "  vite-vue3: http://localhost:5173"
echo "  vue-vapor: http://localhost:5174"
echo ""
echo "🚀 正在启动两个项目..."
pnpm dev 