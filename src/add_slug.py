import os
from pathlib import Path

def add_slug_to_index_md():
    """
    在pages目录下所有子目录的index.md文件中，在title和date上方添加slug字段
    slug的值为该index.md文件所在的目录名称
    """
    # 定义pages目录路径
    pages_dir = Path("pages")
    
    # 检查pages目录是否存在
    if not pages_dir.exists():
        print(f"错误: pages目录不存在 - {pages_dir}")
        return False
    
    # 统计处理结果
    total_files = 0
    modified_files = 0
    
    # 遍历pages目录下的所有子目录
    for root, dirs, files in os.walk(pages_dir):
        # 检查当前目录下是否有index.md文件
        if "index.md" in files:
            total_files += 1
            index_md_path = Path(root) / "index.md"
            dir_name = os.path.basename(root)  # 获取当前目录名称
            slug_value = f"/{dir_name}"  # 构建slug值，如"/01demo"
            
            try:
                # 读取文件内容
                with open(index_md_path, 'r', encoding='utf-8') as f:
                    lines = f.readlines()
                
                # 检查是否已经存在slug字段
                has_slug = any(line.strip().startswith('slug:') for line in lines)
                if has_slug:
                    print(f"已存在slug，跳过: {index_md_path}")
                    continue
                
                # 查找title或date所在的位置，确定插入点
                insert_position = 0
                for i, line in enumerate(lines):
                    stripped_line = line.strip()
                    if stripped_line.startswith('title:') or stripped_line.startswith('date:'):
                        insert_position = i
                        break
                else:
                    # 如果没有找到title或date，就添加到文件开头
                    insert_position = 0
                
                # 插入slug字段
                slug_line = f"slug: \"{slug_value}\"\n"
                lines.insert(insert_position, slug_line)
                
                # 如果插入位置不是0，可能需要添加空行分隔
                if insert_position > 0 and not lines[insert_position-1].strip() == "":
                    lines.insert(insert_position, "\n")
                    insert_position += 1
                
                # 写回文件
                with open(index_md_path, 'w', encoding='utf-8') as f:
                    f.writelines(lines)
                
                modified_files += 1
                print(f"已添加slug: {index_md_path} -> {slug_value}")
                
            except Exception as e:
                print(f"处理文件时出错 {index_md_path}: {str(e)}")
    
    print(f"\n处理完成: 共检查 {total_files} 个index.md文件，成功添加 {modified_files} 个slug")
    return True

def main():
    """程序入口"""
    print("开始为index.md文件添加slug...")
    add_slug_to_index_md()
    print("slug添加操作结束!")

if __name__ == "__main__":
    main()
    
