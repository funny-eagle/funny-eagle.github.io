import os
from pathlib import Path

def find_directories_missing_slug():
    """
    查找pages目录下所有子目录中，其index.md文件不包含slug关键字的目录路径
    """
    # 定义pages目录路径
    pages_dir = Path("pages")
    
    # 检查pages目录是否存在
    if not pages_dir.exists():
        print(f"错误: pages目录不存在 - {pages_dir}")
        return []
    
    # 存储缺少slug的目录路径
    missing_slug_dirs = []
    
    # 遍历pages目录下的所有子目录
    for root, dirs, files in os.walk(pages_dir):
        # 检查当前目录下是否有index.md文件
        if "index.md" in files:
            index_md_path = Path(root) / "index.md"
            dir_path = Path(root)
            
            try:
                # 读取文件内容，检查是否包含slug关键字
                has_slug = False
                with open(index_md_path, 'r', encoding='utf-8') as f:
                    for line in f:
                        if line.strip().startswith('slug:'):
                            has_slug = True
                            break
                
                # 如果不包含slug，记录目录路径
                if not has_slug:
                    missing_slug_dirs.append(str(dir_path))
                    print(f"缺少slug: {dir_path}")
                
            except Exception as e:
                print(f"读取文件时出错 {index_md_path}: {str(e)}")
    
    return missing_slug_dirs

def main():
    """程序入口"""
    print("开始查找缺少slug的目录...")
    missing_dirs = find_directories_missing_slug()
    
    print("\n查找完成:")
    if missing_dirs:
        print(f"共发现 {len(missing_dirs)} 个缺少slug的目录：")
        for dir_path in missing_dirs:
            print(f"- {dir_path}")
    else:
        print("所有目录的index.md文件都包含slug关键字")

if __name__ == "__main__":
    main()
    
